# Resque

num_workers = (RAILS_ENV == 'production') ? 4 : 2
 
num_workers.times do |num|
  God.watch do |w|
    w.name     = "resque=#{num}"
    w.interval = 30.seconds
	w.env = {"QUEUE"=>"paperclip", "RAILS_ENV"=>RAILS_ENV}

    w.start    = "#{BIN_PATH}/rake -f #{RAILS_ROOT}/Rakefile environment resque:work"
	w.start_grace = 10.seconds
	
    # restart if memory gets too high
    w.transition(:up, :restart) do |on|
      on.condition(:memory_usage) do |c|
        c.above = 350.megabytes
        c.times = 2
      end
    end

    # determine the state on startup
    w.transition(:init, { true => :up, false => :start }) do |on|
      on.condition(:process_running) do |c|
        c.running = true
      end
    end

    # determine when process has finished starting
    w.transition([:start, :restart], :up) do |on|
      on.condition(:process_running) do |c|
        c.running = true
        c.interval = 5.seconds
      end

      # failsafe
      on.condition(:tries) do |c|
        c.times = 5
        c.transition = :start
        c.interval = 5.seconds
      end
    end

    # start if process is not running
    w.transition(:up, :start) do |on|
      on.condition(:process_running) do |c|
        c.running = false
      end
    end

	# stop process if it keeps restarting
	w.lifecycle do |on|
	    on.condition(:flapping) do |c|
	      c.to_state = [:start, :restart]
	      c.times = 5
	      c.within = 5.minute
	      c.transition = :unmonitored
	      c.retry_in = 10.minutes
	      c.retry_times = 5
	      c.retry_within = 2.hours
	    end
	  end
  end
end

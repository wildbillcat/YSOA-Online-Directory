# Redis

%w{6379}.each do |port|
  God.watch do |w|
    w.name          = "redis"
    w.interval      = 30.seconds
   	w.start 		= "/usr/bin/redis-server" 
	w.stop 			= "/usr/bin/redis-cli -p 6379 shutdown" 
	w.restart 		= "#{w.stop} && #{w.start}"

    w.start_grace   = 10.seconds
    w.restart_grace = 10.seconds

    w.start_if do |start|
      start.condition(:process_running) do |c|
          c.interval = 5.seconds
          c.running = false
      end
    end
  end
end
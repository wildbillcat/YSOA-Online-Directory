class ApplicationController < ActionController::Base

    helper :all # include all helpers, all the time
    protect_from_forgery # See ActionController::RequestForgeryProtection for details

    helper_method :current_user, :current_semester

    before_filter RubyCAS::Filter

    def current_user
      @current_user ||= User.find_by_netid(session[:cas_user])
      # The first time the line above is called, the @current_user variable will be nil 
      # and so the database call will be made. For all subsqeuent calls to the same method,
      # @current_user will contain the current user so the request to the database won’t be made.
    end

    def unregistered_user
      if current_user.nil?
        flash[:notice] = "It doesn't look like you're in our records as an Architecture student.  
          You'll need to enter some information before registering."
        redirect_to new_user_path
      end
    end

    def logout
      @current_user = nil
      RubyCAS::Filter.logout(self)
    end

    def permission_denied
      flash[:notice] = "Sorry, but you're not allowed to do that."
      redirect_to @current_user
    end

    def end_of_summer_session
      summerend = Holiday.find_by_name("Summer").end_date
      summerend.yday
    end

    def end_of_spring_session
      springend = Holiday.find_by_name("Spring").end_date
      springend.yday
    end

    def current_semester(time = Time.now)
      year = time.strftime('%Y')
      day = Date.today
      if day.yday <= end_of_spring_session
        season = 'Spring'
      elsif day.yday <= end_of_summer_session
        season = 'Summer'
      else
        season = 'Fall'
      end
      "#{season} #{year}" 
    end

    def current_time(time = Time.now)
      time.strftime("%b #{time.day.ordinalize} %I:%M %p")
    end


end

class RegistrationController < ApplicationController
# redirects from app/registration to user's info page, if user is in system, or to new user page if not
  def index
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to new_user_path
    end
  end
end

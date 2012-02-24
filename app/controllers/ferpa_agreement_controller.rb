class FerpaAgreementController < ApplicationController
  
  #Gets user ID from routing and converts it to an @user object using get_user
  #before_filter :get_user
  #before_filter :unregistered_user

  filter_resource_access

  layout "directory"
  
  def agreement
  #@current_user = current_user
  end
  
  def update
    #@current_user = current_user
    #if params[:agree_ferpa]==true
     # @current_user.set_ferpa
      #redirect_to submissions_path
    #else
    redirect_to directory_path 
    #end
  end

end

class FerpaAgreementController < ApplicationController
  
  #Gets user ID from routing and converts it to an @user object using get_user
  #before_filter :get_user

  #before_filter :unregistered_user

  filter_resource_access

  layout "directory"
  
  def agreement
  @user = @current_user
  @user.last_ferpa_agreement
  end

 # private

  # def get_user
     #@user = User.find(params[:user_id])
   #end
end

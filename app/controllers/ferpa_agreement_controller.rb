class FerpaAgreementController < ApplicationController
  
  #Gets user ID from routing and converts it to an @user object using get_user
  before_filter :get_user

  before_filter :unregistered_user

  filter_resource_access

  layout "directory"
  
  def agreement
  @user = @current_user
  end
  
  def update
    @user = @current_user
    if params[:agree_ferpa] = true
      @user.set_ferpa
      redirect_to submissions_path
    else
    redirect_to "directory#index" 
    end
  end

  private

  def get_user
      @user = User.find(params[:user_id])
  end
end

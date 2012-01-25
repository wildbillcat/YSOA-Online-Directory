class FerpaAgreementController < ApplicationController
  
  #Gets user ID from routing and converts it to an @user object using get_user
  before_filter :get_user

  before_filter :unregistered_user

  filter_resource_access

  layout "directory"
  
  def index
    @laser_agreements = @user.laser_agreements
  end
  
  def agreement
  render :action => "ferpa"
  end

end

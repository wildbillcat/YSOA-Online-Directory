class LaserAgreementsController < ApplicationController

  #Gets user ID from routing and converts it to an @user object using get_user
  before_filter :get_user
  before_filter :unregistered_user
  filter_resource_access

  layout "directory"

  def index
    @laser_agreements = @user.laser_agreements
  end

  def show
    @laser_agreement = @user.laser_agreements.find(params[:id])
  end

  def new
    @laser_agreement = @user.laser_agreements.build
  end

  def edit
    @laser_agreement = @user.laser_agreements.find(params[:id])
  end

  def create
    @laser_agreement = @user.laser_agreements.build(params[:laser_agreement])
    @laser_agreement.laser_agree_date = Time.now
    @laser_agreement.semester = current_semester
    if @laser_agreement.save
      @user.laser_agreement_id = @laser_agreement.id
      @user.last_laser_agree_semester = current_semester
      @user.save
      flash[:notice] = 'You are now registered to use the laser cutters.  Please follow all posted safety guidelines.'
      redirect_to(@user)
    else
      render :action => "new" 
    end
  end

  def update
    @laser_agreement = @user.laser_agreements.find(params[:id])
    if @laser_agreement.update_attributes(params[:laser_agreement])
      flash[:notice] = 'Laser agreement was successfully updated.'
      redirect_to(@user) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @laser_agreement = @user.laser_agreements.find(params[:id])
    @user.laser_agreement_id = nil
    @user.last_laser_agree_semester = nil
    @user.save
    @laser_agreement.destroy
    flash[:notice] = 'Laser agreement was successfully destroyed.'
    redirect_to(@user) 
  end
  
  private

   def get_user
     @user = User.find(params[:user_id])
   end
end

class EquipAgreementsController < ApplicationController

  #Gets user ID from routing and converts it to an @user object using get_user
  before_filter :get_user
  before_filter :unregistered_user  
  filter_resource_access
  
  layout "directory"

  def index
    @equip_agreements = @user.equip_agreements
  end

  def show
    @equip_agreement = @user.equip_agreements.find(params[:id])
  end

  def new
    @equip_agreement = @user.equip_agreements.build 
  end

  def edit
    @equip_agreement = @user.equip_agreements.find(params[:id])
  end

  def create
    @equip_agreement = @user.equip_agreements.build(params[:equip_agreement])
    @equip_agreement.equip_agree_date = Time.now
    @equip_agreement.semester = current_semester
    if @equip_agreement.save
      @user.equip_agreement_id = @equip_agreement.id
      # sets the equip_agreement_id flag in @user so we know they've agreed
      @user.last_equip_agree_semester = current_semester
      @user.save
      flash[:notice] = 'You are now registered to check out equipment from the Digital Media office.'
      redirect_to(@user) 
    else
      render :action => "new"
    end
  end

  def update
    @equip_agreement = @user.equip_agreements.find(params[:id])
    if @equip_agreement.update_attributes(params[:equip_agreement])
      flash[:notice] = 'Equipment agreement was successfully updated.'
      redirect_to(@user) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @equip_agreement = @user.equip_agreements.find(params[:id])
    @user.equip_agreement_id = nil
    @user.last_equip_agree_semester = nil
    @user.save
    @equip_agreement.destroy
    # removes the equip_agreement_id flag in @user    
    flash[:notice] = "Successfully deleted equipment agreement."   
    redirect_to(@user) 
  end
  
  private

   def get_user
     @user = User.find(params[:user_id])
   end
end

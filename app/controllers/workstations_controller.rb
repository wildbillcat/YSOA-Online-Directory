class WorkstationsController < ApplicationController

  before_filter :unregistered_user
    
  filter_resource_access

  layout "directory"

  def index
    @user = nil
      # Sets user to nil, then searches for workstations of a particular user if user_id is not blank
    unless params[:user_id].blank?
      @user = User.find(params[:user_id])
      @search = Workstation.search :user_id_equals => @user.id
    else
      @search= Workstation.search(params[:search])          
    end
    @search.meta_sort ||= 'registration_date.desc'
    @workstations = @search.paginate(:page => params[:page], :per_page => workstations_per_page) 
    respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @workstations }
        format.csv { send_data @workstations.to_csv }
        format.js {
              render :update do |page|
                # 'page.replace' will replace full "results" block...works for this example
                # 'page.replace_html' will replace "results" inner html...useful elsewhere
                page.replace 'results', :partial => 'workstationview'
              end
        }
    end   
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @workstation = @user.workstations.build(params[:workstation])
    @workstation.registration_date = Time.now
    @workstation.netid = @user.netid
    @workstation.semester = current_semester
    if @workstation.save
      @user.workstation_id = @workstation.id
      @user.save
      flash[:notice] = 'Thank you for registering your workstation.'
      redirect_to(@user) 
    else
      render :action => "new" 
    end
  end

  def update
    if @workstation.update_attributes(params[:workstation])
      flash[:notice] = 'Workstation was successfully updated.'
      redirect_to(@workstation) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    userid = @workstation.user_id 
    @user = User.find(userid)
    if @user != nil
      @user.workstation_id = nil
      @user.save
    end
    @workstation.destroy
    flash[:notice] = "Workstation was successfully destroyed."
    redirect_to(workstations_path) 
  end
  
  
  private
  
  def get_user
    @user = User.find(params[:user_id])
  end
  
  def workstations_per_page
    if params[:per_page]
      session[:workstations_per_page] = params[:per_page]
    end
    session[:workstations_per_page]
  end
end

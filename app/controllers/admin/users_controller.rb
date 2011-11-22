class Admin::UsersController < ApplicationController
  
  
  filter_resource_access

#  skip_before_filter :unregistered_user, :only => [:new, :create]

  layout "directory"

  def index
    @search = User.search(params[:search])
    @search.meta_sort ||= 'last_name.asc'
    @users = @search.paginate(:page => params[:page], :per_page => users_per_page )
    respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @users }
        #format.csv { send_data @users.to_csv }
        format.csv { 
          csvresults = CSV.generate do |csv|
          csv << ["First Name", "Last Name", "Nick Name", "NetID", "Program", "Program Year", "Undergrad College", "Class Year", "E-mail", "Role", "Status", "Position", "SID Number"]
          @users.each do |user|
            csv << [user.first_name, user.last_name, user.nickname, user.netid, user.program, user.program_year, user.undergrad_college, user.class_year, user.email, user.role, user.status, user.position, user.sid_number]
          end
        end 
        send_data(csvresults, :type => 'text/csv', :filename => 'results.csv')
        }
        format.js {
              render :update do |page|
                # 'page.replace' will replace full "results" block...works for this example
                # 'page.replace_html' will replace "results" inner html...useful elsewhere
                page.replace 'results', :partial => 'userview'
              end
        }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    if current_user and current_user.role == 'admin'
      @user = User.new
    else
      @user = User.new(User.search_ldap(session[:cas_user]))
      @user.netid = session[:cas_user]
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.netid = session[:cas_user] unless current_user and current_user.role == 'admin'
      #user netid is set to session user unless admin is creating the user
    netid = @user.netid
    @user.role = 'student' unless current_user and current_user.role == 'admin' 
      #user role set to student automatically unless admin is creating the user 
    @user.role = 'admin' if User.count == 0  
      # first user is always admin
    @user.image_url = "/images/students/#{netid}.jpg"
      # image url is set automatically
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to(@user) 
    else
      render :action => "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
  
  private
  
  def users_per_page
    if params[:per_page]
      session[:users_per_page] = params[:per_page]
    end
    session[:users_per_page]
  end
  
end

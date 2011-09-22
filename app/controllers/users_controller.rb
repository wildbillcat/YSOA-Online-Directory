class UsersController < ApplicationController
  
  
  filter_resource_access :additional_collection => [:edit_multiple, :update_multiple, :print_multiple]

#  before_filter :unregistered_user
#  skip_before_filter :unregistered_user, :only => [:new, :create]
  layout "directory"

  def index
    @search = User.search(params[:search])
    @search.meta_sort ||= 'last_name.asc'
    if @search.count > 0
      @users = @search.paginate(:page => params[:page], :per_page => users_per_page )
      if params[:scope]
        @users = User.send(params[:scope])
        @users.paginate(:page => params[:page], :per_page => users_per_page )
      end
      respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @users }
        format.csv { send_data @users.to_csv }
        format.js {
              render :update do |page|
                # 'page.replace' will replace full "results" block...works for this example
                # 'page.replace_html' will replace "results" inner html...useful elsewhere
                page.replace 'results', :partial => 'userview'
              end
          }      
        end
    else
      flash[:notice] = "Sorry, your search didn't return any results."
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
      if permitted_to? :edit, @user
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
      unless permitted_to? :edit, @user
        @user.netid = session[:cas_user]
        @user.role = 'student'
      end
      netid = @user.netid
      @user.role = 'admin' if User.count == 0  
        # first user is always admin
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
    redirect_to users_path
  end
  
  def edit_multiple
    if params[:user_ids]
      @users = User.find(params[:user_ids], :order => "last_name, first_name") 
    else
      flash[:notice] = "You haven't selected any records"
      redirect_to users_path
    end 
  end
  
  def update_multiple
    @users = User.find(params[:user_ids])  
    @users.each do |user|  
      user.update_attributes!(params[:user].reject { |k,v| v.blank? })  
    end  
    flash[:notice] = "Updated users!"  
    redirect_to users_path
  end
  
  def print_multiple
    if params[:user_ids]
      @users = User.find(params[:user_ids], :order => "last_name, first_name")
    else
      flash[:notice] = "You haven't selected any records"
      redirect_to users_path
    end 
  end
  
  
  private
  
  def users_per_page
    if params[:per_page]
      session[:users_per_page] = params[:per_page]
    end
    session[:users_per_page]
  end
  
end

class HolidaysController < ApplicationController
 
    filter_resource_access

    layout "directory"
 
 
  def index
    @holidays = Holiday.find(:all, :order => "start_date")
  end


  def show
    @holiday = Holiday.find(params[:id])
  end


  def new
    @holiday = Holiday.new
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end


  def create
    @holiday = Holiday.new(params[:holiday])

    respond_to do |format|
      if @holiday.save
        flash[:notice] = 'Holiday was successfully created.'
        format.html { redirect_to(holidays_url) }
        format.xml  { render :xml => @holiday, :status => :created, :location => @holiday }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @holiday = Holiday.find(params[:id])

    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        flash[:notice] = 'Holiday was successfully updated.'
        format.html { redirect_to(@holiday) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @holiday.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy

    respond_to do |format|
      format.html { redirect_to(holidays_url) }
      format.xml  { head :ok }
    end
  end
end

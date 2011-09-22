class ProductsController < ApplicationController

  filter_resource_access


  def index
    @search = Product.search(params[:search])
    @search.meta_sort ||= 'name.asc'
    @products = @search

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end


  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product }
    end
    
    rescue ActiveRecord::RecordNotFound 
    logger.error("Attempt to access invalid product #{params[:id]}") 
    flash[:notice] = "Invalid Product" 
    redirect_to :action => 'index'
    
  end

 
  def new
    @product = Product.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product }
    end
  end


  def edit
    @product = Product.find(params[:id])
  end

  
  def create
    @product = Product.new(params[:product])
    
    respond_to do |format|
      if @product.save
        flash[:notice] = 'Product was successfully created.'
        format.html { redirect_to(products_path) }
        format.xml  { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @product = Product.find(params[:id])
    
    respond_to do |format|
      if @product.update_attributes(params[:product])
        flash[:notice] = "#{@product.name} updated."
        format.html { redirect_to(products_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      flash[:notice] = "#{@product.name} deleted."
      format.html { redirect_to(products_path) }
      format.xml  { head :ok }
    end
  end
      
  private
  
  def products_per_page
    if params[:per_page]
      session[:products_per_page] = params[:per_page]
    end
    session[:products_per_page]
  end
  
end

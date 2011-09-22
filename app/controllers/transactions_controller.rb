class TransactionsController < ApplicationController

  filter_resource_access
  layout "directory"
 
  def index
    @product = nil
    # Sets product to nil, then searches for transactions of a particular product if product_id is not blank
    unless params[:product_id].blank?
      @product = Product.find(params[:product_id])
      @search = Transaction.search(:product_name => @product.name)
    else
      @search= Transaction.search(params[:search])          
    end
    @search.meta_sort ||= 'id.desc'
    @transactions = @search.paginate(:page => params[:page])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
      format.csv { send_data @transactions.to_csv }
       format.js {
              render :update do |page|
                # 'page.replace' will replace full "results" block...works for this example
                # 'page.replace_html' will replace "results" inner html...useful elsewhere
                page.replace 'results', :partial => 'transactionview'
              end
          }
    end
  end


  def show
    @transaction = Transaction.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
    
    rescue ActiveRecord::RecordNotFound 
    logger.error("Attempt to access invalid transaction #{params[:id]}") 
    flash[:notice] = "Invalid Transaction" 
    redirect_to :action => 'index'    
  end


  def new
    @product = Product.find(params[:product_id])    
    @transaction = @product.transactions.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end


  def edit
    @transaction = Transaction.find(params[:id])
  end


  def create
    @product = Product.find(params[:product_id])
    @transaction = @product.transactions.build(params[:transaction])
    if !@product.transaction_id        
      @user = current_user
      @transaction.checkout_date = Date.today
      @transaction.product_name = @product.name
      @transaction.checkout_by = @user.netid
      if params[:transaction][:due_date] && !params[:transaction][:due_date].blank?
        @transaction.due_date = params[:transaction][:due_date]
      else
        @transaction.due_date = @transaction.next_business_day(Date.today)          
      end

      respond_to do |format|
        if @transaction.save
          @product.transaction_id = @transaction.id
          @product.save
          flash[:notice] = "Okay, it's checked out."
          format.html { redirect_to(products_url) }
          format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "This is already checked out!"
      redirect_to(products_url)
    end
  end

 
  def update
    @transaction = Transaction.find(params[:id])
    
    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        flash[:notice] = 'Transaction was successfully updated.'
        format.html { redirect_to(@transaction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end


  def checkin
    @product = Product.find(params[:product_id])
    @transaction = Transaction.find(params[:id])
    @user = current_user
    @transaction.checkin_date = Date.today
    dayslate = @transaction.dayslate
    if dayslate > 0
      @transaction.days_late = dayslate
    end
    @transaction.checkin_by = @user.netid
    if @product.transaction_id      
      @product.transaction_id = nil    
      @transaction.save
      @product.save
      if @transaction.due_date
        if @transaction.due_date >= Date.today
          flash[:notice] = "Okay, it's checked in!"
          redirect_to(products_url)
        else
          flash[:notice] = "Checked in, but it was #{dayslate} days late!"
          redirect_to(products_url)
        end
      end
    else
      flash[:notice] = "This was already checked in!"
      redirect_to(products_url)
    end
  end 

  # recent transactions for Product "Show" page
  def recent_transactions
    @product = Product.find(params[:product_id])
    @transactions = @product.transactions(params[:limit => 4 ]).descend_by_id
  end
  
    
  private
  
  def get_product
    @product = Product.find(params[:product_id])
  end


end

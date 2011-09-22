class Product < ActiveRecord::Base

  validates_presence_of :name, :description, :image_url
  validates_uniqueness_of :name
  
  #a product can have many transactions
  has_many :transactions
  accepts_nested_attributes_for :transactions
 

  def recent_transactions
    Transaction.find_all_by_product_name(name, :order => "id DESC", :limit => 4)
     #Transaction.find(:all, :conditions => ["product_name = ?", name], :order => "id DESC", :limit => 4)    
  end
  
  def current_transaction
    if transaction_id
      Transaction.find(transaction_id)
    end
  end

  def status
    if current_transaction
      duedate = current_transaction.due_date
  	  if duedate < Date.today
  	    "lateitem"
  	  else
  	    "checkedout"
  	  end
    else
  	  "available"
    end
  end
  
  def current_borrower
    if current_transaction
      borrower = User.find_by_netid(current_transaction.borrower_netid)
    end
  end

  def current_borrower_name
    if current_borrower
      current_borrower.first_name + ' ' + current_borrower.last_name
    end
  end

  def current_borrower_netid
    if current_borrower
      current_borrower.netid
    end
  end

  def lateitem?
    status == "lateitem"
  end
  
  def extended?
    current_transaction && current_transaction.extended_checkout == true
  end
  
  def checkedout?
    status == "checkedout"
  end
  
  def available?
    status == "available"
  end


  def self.per_page
    4
  end

end

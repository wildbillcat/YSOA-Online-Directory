class Transaction < ActiveRecord::Base
  
  # every transaction is linked to a product, through product_id
  belongs_to :product
  
  #Named scopes for searchlogic
  
  search_methods :late
  
  scope :late, :conditions => ['days_late > 0']
  
  def validate
    if checkout_date.blank? && borrower_netid.blank? && due_date.blank?
    elsif !checkout_date.blank? && !borrower_netid.blank? && !due_date.blank?
      if due_date < checkout_date
        errors.add(:due_date, "is before date borrowed")
      end
    elsif checkout_date.blank?
      errors.add(:checkout_date ,"is not specified")
    elsif borrower_netid.blank?
      errors.add(:borrower_netid ,"is not specified")
    else
      errors.add(:due_date ,"is not specified")
    end
  end
     
  require 'date'
      
  def next_business_day(date)
     next_day = date + 1
     next_day = skip_holidays(next_day)
     next_day = skip_weekends(next_day)
     next_day = skip_holidays(next_day)
     skip_weekends(next_day)
   end    
  

  def skip_weekends(date)
    while (date.wday % 7 == 0) or (date.wday % 7 == 6) do
      date += 1
    end
    date   
  end
  
  #Calculates next business day for due_date

  
  def skip_holidays(date)
    while is_closed?(date) == true do
      date += 1
    end
    date
  end

  def is_closed?(date)
    closed_ranges = Holiday.find(:all, :conditions => ["office_closed = true"])
    # creates an array of all date ranges when the office is closed
    i = closed_ranges.length
    closed_dates = []
    # creates an empty array for all closed dates
    n = 0
    while  n <= (i - 1)
      dates_to_add = (closed_ranges[n].start_date..closed_ranges[n].end_date).to_a
      # creates an array for the closed dates in a range
      closed_dates.push(dates_to_add)
      # adds those closed dates to the array of all closed dates
      n += 1
    end
    closed_dates.flatten!   # flattens the array
    closed_dates.include?(date)     # checks to see if array of closed_dates includes date
  end


  #Days Late

  def dayslate
    weekdays_in_date_range( self.due_date..(Date.today) ) - 1 # 1 day subtracted to account for current day
  end

  #Find Late Transactions
  def find_late
    dayslate = params[:days_late]
    Transaction.find(:all, :conditions => ["dayslate > 0"], :order =>"id DESC")
  end
  

  #pagination
  cattr_reader :per_page
  @@per_page = 25

    
  protected
  
  def weekdays_in_date_range(range)
    range.select { |d| (1..5).include?(d.wday) }.size
  end

end
  


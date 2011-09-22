class Holiday < ActiveRecord::Base

  validates_presence_of :name, :start_date, :end_date
  validates_uniqueness_of :name, :message => 'has already been entered'
  
  validate :check_start_date?
  

  private
  
  def check_start_date?
    if start_date > end_date
      errors.add_to_base("You crazy!  A holiday can't start before it begins!")
    end
  end
   
end

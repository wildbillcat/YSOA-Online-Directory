class Workstation < ActiveRecord::Base
  
  # every workstation is linked to a student, through student_id
  belongs_to :user
  
  validates_presence_of :floor, :cpu_number, :monitor_number, :message => "is required"  
  validates_numericality_of :cpu_number, :greater_than => 0, :message => "must be a number" 
  validates_uniqueness_of :cpu_number, :scope => :semester, :message => "has already been registered for this semester"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered a workstation for this semester"
   
  
  def get_user
    @user = nil
  	unless user_id.blank?
  	  @user = User.find(user_id)
  	end
  end
  	
  def current_owner
    if user_id && User.exists?(user_id)
      current_owner = User.find(user_id)
    end
  end


  
  #pagination
   cattr_reader :per_page
   @@per_page = 25
  
end

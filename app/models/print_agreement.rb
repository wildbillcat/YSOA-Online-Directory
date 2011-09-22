class PrintAgreement < ActiveRecord::Base

  #every agreement is linked to a student, though student_id
  belongs_to :user
  
  validates_presence_of :print_agree, :message => "field must be agreed to"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered for printing this semester"
  
  def print_user(user_id)
     user = User.find(user_id)
     user.netid
   end

end

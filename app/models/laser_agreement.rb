class LaserAgreement < ActiveRecord::Base

  #every agreement is linked to a student, though student_id
  belongs_to :user
  
  validates_presence_of :laser_agree, :message => "field must be agreed to"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered for laser cutting this semester"

  attr_accessor :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8

  validate :check_answers?
  
  def laser_user(user_id)
    user = User.find(user_id)
    user.netid
  end
  
  private
  
  def check_answers?
    unless question1 == 'true' && question2 == 'true' && question3 == 'false' && question4 == 'true' && question5 == 'false' && question6 == 'true' && question7 == 'false' && question8 == 'false'
      errors.add_to_base("You answered one or more of the questions incorrectly - please re-review the laser safety video and try again")
    end
  end
  

 
end

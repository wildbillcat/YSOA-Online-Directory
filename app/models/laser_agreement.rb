class LaserAgreement < ActiveRecord::Base

  #every agreement is linked to a student, though student_id
  belongs_to :user
  
  validates_presence_of :laser_agree, :message => "field must be agreed to"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered for laser cutting this semester"

  attr_accessor :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12, :question13, :question14, :question15
  
  validate :check_answers?
  
  
  def laser_user(user_id)
    user = User.find(user_id)
    user.netid
  end
  
  private
  
  def check_answers?
    unless ((question1 == 'true' || question1.nil?) && 
      (question2 == 'true' || question2.nil?) && 
      (question3 == 'false' || question3.nil?) && 
      (question4 == 'true' || question4.nil?) && 
      (question5 == 'false' || question5.nil?) && 
      (question6 == 'true' || question6.nil?) && 
      (question7 == 'false' || question7.nil?) && 
      (question8 == 'false' || question8.nil?) && 
      (question9 == 'true' || question9.nil?) && 
      (question10 == 'false' || question10.nil?) && 
      (question11 == 'true' || question11.nil?) && 
      (question12 == 'false' || question12.nil?) && 
      (question13 == 'true' || question13.nil?) && 
      (question14 == 'false' || question14.nil?) && 
      (question15 == 'false' || question15.nil?))
      errors.add_to_base("You answered one or more of the questions incorrectly - please re-review the laser safety video and try again")
    end
  end
  

 
end

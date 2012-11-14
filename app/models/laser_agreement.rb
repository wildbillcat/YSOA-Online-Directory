class LaserAgreement < ActiveRecord::Base

  #every agreement is linked to a student, though student_id
  belongs_to :user
  
  validates_presence_of :laser_agree, :message => "field must be agreed to"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered for laser cutting this semester"

  attr_accessor :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12, :question13, :question14, :question15
  attr_accessor :masterquestions
  validate :check_answers?
  
  
  def laser_user(user_id)
    user = User.find(user_id)
    user.netid
  end
  
  private
  
  def check_answers?
    masterQuestions = [ masterquestions ]
    unless ((question1 == 'true' || masterQuestions[0]=='false') && 
      (question2 == 'true' || masterQuestions[1]=='false') && 
      (question3 == 'false' || masterQuestions[2]=='false') && 
      (question4 == 'true' || masterQuestions[3]=='false') && 
      (question5 == 'false' || masterQuestions[4]=='false') && 
      (question6 == 'true' || masterQuestions[5]=='false') && 
      (question7 == 'false' || masterQuestions[6]=='false') && 
      (question8 == 'false' || masterQuestions[7]=='false') && 
      (question9 == 'true' || masterQuestions[8]=='false') && 
      (question10 == 'false' || masterQuestions[9]=='false') && 
      (question11 == 'true' || masterQuestions[10]=='false') && 
      (question12 == 'false' || masterQuestions[11]=='false') && 
      (question13 == 'true' || masterQuestions[12]=='false') && 
      (question14 == 'false' || masterQuestions[13]=='false') && 
      (question15 == 'false' || masterQuestions[14]=='false'))
      errors.add_to_base("You answered one or more of the questions incorrectly - please re-review the laser safety video and try again")
    end
  end
  

 
end

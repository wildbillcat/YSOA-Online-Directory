class LaserAgreement < ActiveRecord::Base

  #every agreement is linked to a student, though student_id
  belongs_to :user
  
  validates_presence_of :laser_agree, :message => "field must be agreed to"
  validates_uniqueness_of :user_id, :scope => :semester, :message => "has already registered for laser cutting this semester"

  attr_accessor :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :question11, :question12, :question13, :question14, :question15
  attr_accessor :MasterQuestions
  validate :check_answers?
  
  
  def laser_user(user_id)
    user = User.find(user_id)
    user.netid
  end
  
  private
  
  def check_answers?
    unless (question1 == 'true' || params[:MasterQuestions[0]]=='false') && (question2 == 'true' || params[:MasterQuestions[1]]=='false') && (question3 == 'false' || params[:MasterQuestions[0]]=='false') && (question4 == 'true' || params[:MasterQuestions[0]]=='false') && (question5 == 'false' || params[:MasterQuestions[0]]=='false') && (question6 == 'true' || params[:MasterQuestions[0]]=='false') && (question7 == 'false' || params[:MasterQuestions[0]]=='false') && (question8 == 'false' || params[:MasterQuestions[0]]=='false')
      errors.add_to_base("You answered one or more of the questions incorrectly - please re-review the laser safety video and try again")
    end
  end
  

 
end

class Submission < ActiveRecord::Base
  belongs_to :user

  has_attached_file :portfolio, 
    :storage => :filesystem,
    :path => ":rails_root/public/uploads/:attachment/:id/:basename_:style.:extension",
    :url => "/uploads/:attachment/:id/:basename_:style.:extension",
    :default_url => "/uploads/:attachment/default/default_:style.png",
    :styles => {
      :large => ["800x800>", :png],
      :small => ["300x300>", :png]
    }
  
  process_in_background :portfolio

  validates_attachment_presence :portfolio
  validates_attachment_size :portfolio, :less_than => 50.megabytes
  
  COLLECTIONS = ['Design Review: MArch1', 'Design Review: MArch2', 'Graduating Review: MArch1', 'Graduating Review: MArch 2', '1st Year Design Studio: Rock Lobster', '1st Year Design Studio: Dance Machine', '2nd Year Design Studio', 'Advanced Design Studio', 'Final Portfolio Submission December 2011', 'Graduating Students Portfolio Submission December 2011', '1021a Final Boards 2011', "KPF Submissions"]

  def owner
    if user_id && User.exists?(user_id)
      User.find(user_id)
    end
  end
  
  #pagination
    cattr_reader :per_page
    @@per_page = 1
    # since each uploaded file also has two thumbnails which count as records (but are hidden),
    # per_page should be the number of records you want to show per page  x 3
    
    
end

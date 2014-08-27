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
  
<<<<<<< HEAD
  COLLECTIONS = ['Design Review: MArch1 2014 to 2015', 'Design Review: MArch2 2014 to 2015',
     'Graduating Students Portfolio Submission December 2014']
=======
  COLLECTIONS = ['Design Review: MArch1 2013 to 2014', 'Design Review: MArch2 2013 to 2014', 'RAMSA Travel Fellowship',
     '250a Junior Studio Portfolio Review Spring 2014', 'KPF Traveling Fellowship 2014']
>>>>>>> 19e2d6b6275e58f10d434fafc1e523ffb7074d76

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

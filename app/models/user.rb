class User < ActiveRecord::Base

  # A user can have many workstations and agreements.  We'll need to limit it to one per academic session through validation.
  has_many :workstations
  has_many :print_agreements, :dependent => :destroy
  has_many :equip_agreements, :dependent => :destroy
  has_many :laser_agreements, :dependent => :destroy
  has_many :submissions, :dependent => :destroy
 
  
  validates_presence_of :first_name, :last_name, :netid, :email, :status, :role
  validates_uniqueness_of :netid, :message => 'is already registered in the database'
  
  #Named scopes go here

  search_methods :students, :faculty, :staff, :active, :inactive, :undergrad, :gradstudent

  scope :students, where("role LIKE ? AND status LIKE ?", "student", "active")
  scope :faculty, where("role LIKE ? AND status LIKE ?", "faculty", "active")
  scope :staff, where("role LIKE ? or role LIKE ? or role LIKE?", "staff", "dmstaff", "admin")
  scope :active, where("status LIKE ?", "active")
  scope :inactive, where("status LIKE ?", "inactive")
  scope :undergrads, where("role LIKE ? AND program LIKE ? AND status LIKE ?", "student", "undergrad", "active")
  scope :gradstudents, where("role LIKE ? AND program NOT LIKE ? AND status LIKE ?", "student", "undergrad", "active")
  
  
  ROLES = %w[student faculty staff dmstaff admin]
    
  PROGRAMS = %w[MARCH1 MARCH2 MED PhD Undergrad MARCH1+FES MARCH1+MED MARCH1+SOM MARCH2+FES MARCH2+MED MARCH2+SOM Summer External VAR]
  
  STATUSES = %w[active inactive graduated leave leave_with_access leave_without_access in_absentia]
  
 
  def role_symbols
    [role.to_sym]
  end

  def name
    if nickname?
      first_name + " " + '"' + nickname + '"' + " " + last_name
    else
      first_name + " " + last_name
    end
  end
  
  def simplerole          # Allows admins and dmstaff to show up in "Staff" search
    if role?
      if role == "admin" or role =="dmstaff"
        return "staff"
      else
        return role
      end
    end
  end

  def self.search_ldap(login)
    ldap = Net::LDAP.new(:host => "directory.yale.edu", :port => 389)
    filter = Net::LDAP::Filter.eq("uid", login)
    attrs = ["givenname", "sn", "eduPersonNickname", "uid", "mail"]
    result = ldap.search(:base => "ou=People,o=yale.edu", :filter => filter, :attributes => attrs)
    return {:first_name  => result[0][:givenname],
            :last_name   => result[0][:sn],
            :nickname    => result[0][:eduPersonNickname],
            :netid       => result[0][:uid],
            :email       => result[0][:mail] } unless result.empty?
  end
  
  def current_cpu_number
    if workstation_id?
#      for workstation in workstations
#     return workstation.cpu_number
      current_cpu = Workstation.find(workstation_id)
      current_cpu.cpu_number
    end
  end
  
  def current_cpu_semester
    if workstation_id?
      current_cpu = Workstation.find(workstation_id)
      current_cpu.semester
    end
  end
    
  def end_of_summer_session
    summerend = Holiday.find_by_name("Summer").end_date
#    summerend = Holiday.find(:first, :conditions => ["name = ?", "Summer"]).end_date
    summerend.yday
  end

  def end_of_spring_session
    springend = Holiday.find_by_name("Spring").end_date
#    springend = Holiday.find(:first, :conditions => ["name = ?", "Spring"]).end_date
    springend.yday
  end

  def this_semester(time = Time.now)
    year = time.strftime('%Y')
    day = Date.today
    if day.yday <= end_of_spring_session
      season = 'Spring'
    elsif day.yday <= end_of_summer_session
      season = 'Summer'
    else
      season = 'Fall'
    end
    this_semester = "#{season} #{year}" 
  end

  def registered_to_print?
    print_agreement_id && last_print_agree_semester == this_semester
  end
  
  def registered_for_equipment?
    equip_agreement_id && last_equip_agree_semester == this_semester
  end
  
  def registered_for_laser?
    laser_agreement_id && last_laser_agree_semester == this_semester
  end
  
  def self.per_page
    4
  end

  def agreed_to_ferpa?
     (last_ferpa_agreement =! nil) && ((Time.now - Date.parse(last_ferpa_agreement)) <= 1.day)
  end

  def my_submissions
     Submission.find_all_by_user_id(id, :order => "id DESC" )    
  end
     
  #pagination
#  cattr_reader :per_page
#  @@per_page = 4
 
  def self.namesearch(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
    else
      find(:all)
    end
  end
  
end

module ApplicationHelper

  def ordinalized_time(time = Time.now)
    time.strftime("%b #{time.day.ordinalize} %I:%M %p")
  end
  
  # page titles in Rails 3 - see http://zetetic.net/blog/2010/05/18/pretty-page-title-in-rails-3/
  
  def page_title(title = nil)
    if title
      content_for(:page_title) { title }
    else
      content_for?(:page_title) ? content_for(:page_title) : APP_CONFIG[:site_name]  # or a hard-coded default
    end
  end
  
  def userimage(user)
    if File.exist?("public#{user.image_url}")
			image_tag user.image_url, :class => 'user-image'
		else
			image_tag "/images/students/placeholder.jpg", :class => 'user-image'
		end
	end

end

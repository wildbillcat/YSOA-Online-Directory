module UsersHelper
  
  def users_per_page_select(collection = User) 
    select_tag :per_page, options_for_select([4, 8, 24, 100, 500], 
  collection.per_page) 
  end
  
  def admin_users_per_page_select(collection = User) 
    select_tag :per_page, options_for_select([20, 500, 1000], 
  collection.per_page) 
  end
  
end

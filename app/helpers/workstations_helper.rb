module WorkstationsHelper
  
  def workstations_per_page_select(collection = Workstation) 
    select_tag :per_page, options_for_select([20, 500, 1000], 
  collection.per_page) 
  end
  
end

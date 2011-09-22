module ProductsHelper

def products_per_page_select(collection = Product) 
  select_tag :per_page, options_for_select([4, 10, 25, 100], collection.per_page) 
end


end

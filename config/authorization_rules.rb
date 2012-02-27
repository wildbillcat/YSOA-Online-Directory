authorization do  
  role :admin do  
    has_permission_on [:admin_users, :users, :workstations, :equip_agreements, :laser_agreements, :print_agreements, :products,
       :transactions, :directory, :submissions, :holidays ], 
      :to => [:index, :show, :new, :create, :edit, :update, :destroy, :edit_multiple, :update_multiple, :checkin, :print_multiple, :advanced_search]
  end 
  
  role :dmstaff do  
     has_permission_on [:admin_users, :users, :workstations, :equip_agreements, :laser_agreements, :print_agreements, :products, 
       :transactions, :directory, :submissions ], 
       :to => [:index, :show, :new, :create, :edit, :update, :edit_multiple, :update_multiple, :checkin ]  
  end
  
  role :staff do
    has_permission_on [:users], :to => [:index, :show, :new, :create, :edit, :update, :edit_multiple, :update_multiple,
        :print_multiple ]
    has_permission_on [:directory], :to => [:index]
   end
   
  role :guest do  
    has_permission_on [:users, :directory], :to => [:index, :show, :new, :create, :print_multiple ]  
  end
  
  role :student do
    has_permission_on [:users, :directory], :to => [:index, :show, :print_multiple ]   
#    has_permission_on :users, :to => [:edit, :update] do
#      if_attribute :id => is {user.id}  
#    end
    has_permission_on [:workstations, :equip_agreements, :laser_agreements, :print_agreements, :directory], :to => [:new, :create ]     
    has_permission_on [:equip_agreements, :laser_agreements, :print_agreements], :to => [:show ] do
      if_attribute :user_id => is {user.id}  
    end 
    has_permission_on [:submissions], :to => [:new, :create] 
    has_permission_on [:submissions], :to => [:show ] do
      if_attribute :user_id => is {user.id}  
    end
    has_permission_on [:products], :to => [:index, :show ]
  end
  
  role :faculty do
    has_permission_on [:users, :directory], :to => [:index, :show, :print_multiple ]   
    has_permission_on [:submissions], :to => [:index, :show]
  end
  
end  

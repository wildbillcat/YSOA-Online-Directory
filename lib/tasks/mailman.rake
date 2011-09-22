desc "Send emails about late products and recent registrations"

task :mailman => :environment do

  #find all items that are overdue and not yet checked in
  late_transactions = Transaction.find(:all, :conditions => ["checkout_by IS NOT NULL and checkin_date IS NULL and due_date < ?", Date.today ])
  if late_transactions.size != 0
    puts "Found #{late_transactions.size} overdue items.  Sending reminder emails..."
    late_transactions.each do |late_transaction|
      EquipMailer.overdue_product_notification(late_transaction).deliver
    end
  else
    puts "No late items."
  end
  puts "Done!"
  
  #find all workstation registrations from the previous day
  workstations = Workstation.find(:all, :conditions => ["registration_date >= ? and registration_date < ?", Time.now - 1.day, Time.now])
  if workstations.size != 0
    puts "Found #{workstations.size} workstation registrations.  Sending email..."
    RegMailer.workstation_registrations_notification(workstations).deliver
  else 
    puts "Nobody registered a workstation yesterday."
  end
  puts "Done!"
  
  #find all print registrations from the previous day
  print_agreements = PrintAgreement.find(:all, :conditions => ["print_agree_date >= ? and print_agree_date < ?", Time.now - 1.day, Time.now])
  if print_agreements.size != 0
    puts "Found #{print_agreements.size} printing registrations.  Sending email..."
    RegMailer.print_registrations_notification(print_agreements).deliver
  else 
     puts "Nobody registered for printing yesterday."
  end
  puts "Done!"
   
  #find all laser cutter registrations from the previous day
  laser_agreements = LaserAgreement.find(:all, :conditions => ["laser_agree_date >= ? and laser_agree_date < ?", Time.now - 1.day, Time.now])
  if laser_agreements.size != 0
    puts "Found #{laser_agreements.size} laser cutter registrations.  Sending email..."
    RegMailer.laser_registrations_notification(laser_agreements).deliver
  else
    puts "Nobody registered for the laser cutters yesterday."
  end
  puts "Done!"
  
  puts "Mailman done."

end
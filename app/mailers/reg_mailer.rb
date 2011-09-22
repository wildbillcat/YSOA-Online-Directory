class RegMailer < ActionMailer::Base

    default :from => "The YSOA Registration App <no-reply@ysoa_registration.app>"
  
    def laser_registrations_notification(laser_agreements)
      @laser_agreements = laser_agreements
      mail( :to => "trevor.d.williams@yale.edu",
            :cc => "vinvent.guerrero@yale.edu, robert.liston@yale.edu, patrick.mcmorran@yale.edu",
            :subject => "Yesterday's Laser Cutter Registrations")
    end

    def print_registrations_notification(print_agreements)
      @print_agreements = print_agreements
      mail( :to => "patrick.mcmorran@yale.edu",
            :cc => "vincent.guerrero@yale.edu, robert.liston@yale.edu",
            :subject => "Yesterday's Printing Registrations")
    end
  
    def workstation_registrations_notification(workstations)
      @workstations = workstations
      mail( :to => "patrick.mcmorran@yale.edu",
            :cc => "vincent.guerrero@yale.edu, robert.liston@yale.edu",
            :subject => "Yesterday's Workstation Registrations")
    end
  
end

class EquipMailer < ActionMailer::Base

  default :from => "The YSOA Equipment Checkout App <no-reply@ysoa_checkout.app>"

  def overdue_product_notification(transaction)
    @transaction = transaction
    mail( :to => "claudia.staffieri@yale.edu",
        :cc => "patrick.mcmorran@yale.edu",  
	:subject => "Oops!  Something's Late!")
  end

end

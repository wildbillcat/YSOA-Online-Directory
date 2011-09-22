class LiveValidationsController < ApplicationController

  def validate_borrower_netid
    if params[:borrower_netid].length > 2
      @borrower = User.find_by_netid(params[:borrower_netid])
      if @borrower && @borrower.registered_for_equipment?
        name = @borrower.name
        netid = @borrower.netid
        @message = "<img src='/images/valid.gif' alt='Registered User' /> <strong>#{name}</strong><br /><br /><img src ='/images/students/#{netid}.jpg' alt='student photo' class='borrower-image' />".html_safe
      else
        @message = "<img src='/images/invalid.gif' alt='Unregistered User' /> <strong>Unregistered User</strong>".html_safe
      end
    else
        @message = ""
    end
    render :partial => "message"
  end  
  
 
  
end

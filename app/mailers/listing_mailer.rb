# This sends an email to all users with all listings.

class ListingMailer < ApplicationMailer    
  default from: "gemvalidate1@gmail.com"

  def listing(email)
      mail(to:email, 
          subject:'Latest ASX initial public offerings')
  end
end

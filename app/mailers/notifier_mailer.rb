# This sends an email to a new user once they have signed up.

class NotifierMailer < ApplicationMailer
  default from: "gemvalidate1@gmail.com"

  def signup_confirmation(email)
      mail(to:email, 
          subject:'Welcome')
  end
end
# Purpose - To send an email to each user. This is not the signup email but instead
# the email sent regularly providing a list of IPOs.

# Loop through User model sending an email to each.  
# app/mailers/listing_mailer

@users = User.all

@users.each do | user |
    ListingMailer.listing(user.email).deliver_now
end

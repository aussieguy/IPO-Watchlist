# Preview all emails at http://localhost:3000/rails/mailers/listing_mailer
class ListingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/listing_mailer/listing
  def listing
    ListingMailer.listing
  end

end

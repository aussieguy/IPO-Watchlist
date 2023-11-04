json.extract! listing, :id, :company, :listingDate, :contact, :activities, :price, :shareType, :code, :capital, :close, :underwriter, :created_at, :updated_at
json.url listing_url(listing, format: :json)

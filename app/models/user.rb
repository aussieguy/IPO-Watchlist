class User < ApplicationRecord
# Ensure that we only have one email address.  No duplicates    
#    validates :email, uniqueness: true
end
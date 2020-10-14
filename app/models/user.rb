class User < ApplicationRecord
    has_secure_password
    has_many :seller_listings, class_name: 'Listing', foreign_key: 'seller_id'
    has_many :buyer_listings, class_name: 'Listing', foreign_key: 'buyer_id'
    has_many :requests, class_name: 'Request', foreign_key: 'buyer_id'
end

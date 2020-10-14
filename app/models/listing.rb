class Listing < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, optional: true,  class_name: 'User'
  has_many :requests
end

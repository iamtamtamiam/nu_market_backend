class Request < ApplicationRecord
  belongs_to :listing
  belongs_to :buyer, class_name: 'User'

 
end

class ListingSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :seller, record_type: :user
  belongs_to :buyer, record_type: :user
  attributes :item, :description, :price, :condition, :status, :zipcode, :contact, :updated_at
end

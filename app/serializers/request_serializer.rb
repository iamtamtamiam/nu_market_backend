class RequestSerializer
  include FastJsonapi::ObjectSerializer 

  belongs_to :buyer, record_type: :user
  belongs_to :listing, record_type: :listing
  attributes :name, :phone, :message, :updated_at, :buyer
end

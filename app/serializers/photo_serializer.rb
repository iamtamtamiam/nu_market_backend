class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :listing
end

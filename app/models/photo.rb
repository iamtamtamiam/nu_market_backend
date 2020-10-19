class Photo < ApplicationRecord
    belongs_to :listing

    validates :url, presence: true
end

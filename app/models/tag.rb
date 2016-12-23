class Tag < ApplicationRecord
  belongs_to :image, inverse_of: :tags
  validates :tag, presence: true
end

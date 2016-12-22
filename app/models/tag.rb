class Tag < ApplicationRecord
  belongs_to :image, inverse_of: :tags
end

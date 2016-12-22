class Category < ApplicationRecord
  belongs_to :board, required: false
  belongs_to :image
end

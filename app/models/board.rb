class Board < ApplicationRecord
  belongs_to :user
  validates_presence_of :user_id
  validates :name, uniqueness: true
  validates :name, presence: true

  has_many :categories
  has_many :images, through: :categories
end

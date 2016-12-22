class Image < ApplicationRecord
	has_many :tags, inverse_of: :image
	accepts_nested_attributes_for :tags

	validates :src, uniqueness: true
	validates :src, presence: true
	
	has_many :categories
	has_many :boards, through: :categories
end

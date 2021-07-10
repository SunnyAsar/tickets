class Event < ApplicationRecord  
  belongs_to :user

  validates :name, :description, :address, :duration, presence: true
  validates :price, presence: :true, if: :paid? 

  enum status: [:unpublished, :published]
  enum costing: [:free, :paid]
end

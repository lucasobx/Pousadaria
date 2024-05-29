class PromotionRoom < ApplicationRecord
  belongs_to :promotion
  belongs_to :inn_room

  validates :discount_percentage, presence: true
end

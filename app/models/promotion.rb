class Promotion < ApplicationRecord
  belongs_to :inn
  has_many :promotion_rooms, dependent: :destroy
  has_many :inn_rooms, through: :promotion_rooms
end

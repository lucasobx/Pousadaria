class CreatePromotionRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :promotion_rooms do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :inn_room, null: false, foreign_key: true
      t.integer :discount_percentage, null: false

      t.timestamps
    end
  end
end

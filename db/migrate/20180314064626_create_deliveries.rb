class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.integer :prefecture_id
      t.string :address
      t.string :zipcode
      t.string :tel
      t.string :name

      t.timestamps
    end
  end
end

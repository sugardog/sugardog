class CreateCdCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :cd_carts do |t|
      t.integer :cd_id
      t.integer :count
      t.integer :cart_id

      t.timestamps
    end
  end
end

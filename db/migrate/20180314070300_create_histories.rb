class CreateHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :histories do |t|
      t.integer :cd_id
      t.integer :delivery_id
      t.integer :total_price
      t.integer :status
      t.datetime :soft_destroyed_at

      t.timestamps
    end
  end
end

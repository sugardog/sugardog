class CreateCdHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :cd_histories do |t|
      t.integer :history_id
      t.integer :cd_id
      t.integer :count
      t.integer :last_price
      t.integer :last_discount
      t.integer :review_id

      t.timestamps
    end
  end
end

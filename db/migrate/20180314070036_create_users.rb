class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kana_last_name
      t.string :email
      t.string :zipcode
      t.string :tel
      t.integer :prefecture_id
      t.string :address
      t.string :password
      t.string :nickname
      t.datetime :soft_destroyed_at
      t.integer :cart_id

      t.timestamps
    end
  end
end

class CreateCds < ActiveRecord::Migration[5.1]
  def change
    create_table :cds do |t|
      t.string :album_name
      t.string :album_kana_name
      t.text :image_id
      t.string :label
      t.integer :price
      t.integer :stock
      t.date :release_date
      t.text :cd_introduction
      t.integer :artist_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end

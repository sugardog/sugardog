class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :artist_kana_name
      t.text :introduction
      t.text :image_id

      t.timestamps
    end
  end
end

class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :song_kana_name
      t.integer :order_num
      t.string :minutes
      t.integer :disc_id
      t.integer :singer_id

      t.timestamps
    end
  end
end

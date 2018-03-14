class CreateCdGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :cd_genres do |t|
      t.integer :genre_id
      t.integer :cd_id

      t.timestamps
    end
  end
end

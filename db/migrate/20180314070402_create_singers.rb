class CreateSingers < ActiveRecord::Migration[5.1]
  def change
    create_table :singers do |t|
      t.string :singer_name
      t.string :singer_kana_name

      t.timestamps
    end
  end
end

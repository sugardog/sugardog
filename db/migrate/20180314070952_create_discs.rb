class CreateDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :discs do |t|
      t.integer :cd_id
      t.integer :disc_num

      t.timestamps
    end
  end
end

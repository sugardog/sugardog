class CreateRankings < ActiveRecord::Migration[5.1]
  def change
    create_table :rankings do |t|
      t.integer :cd_id
      t.integer :rank

      t.timestamps
    end
  end
end

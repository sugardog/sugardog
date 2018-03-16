class CreatePopImages < ActiveRecord::Migration[5.1]
  def change
    create_table :pop_images do |t|
      t.text :image_id

      t.timestamps
    end
  end
end

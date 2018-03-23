class AddPrefectureIdToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :prefecture_id, :integer
  end
end

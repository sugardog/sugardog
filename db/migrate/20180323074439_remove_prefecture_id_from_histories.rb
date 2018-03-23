class RemovePrefectureIdFromHistories < ActiveRecord::Migration[5.1]
  def change
    remove_column :histories, :Prefecture_id, :integer
  end
end

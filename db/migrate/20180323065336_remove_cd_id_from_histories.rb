class RemoveCdIdFromHistories < ActiveRecord::Migration[5.1]
  def change
    remove_column :histories, :cd_id, :integer
  end
end

class RemoveStatusFromHistories < ActiveRecord::Migration[5.1]
  def change
    remove_column :histories, :status, :integer
  end
end

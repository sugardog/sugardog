class RemoveDeliveryIdFromHistories < ActiveRecord::Migration[5.1]
  def change
    remove_column :histories, :delivery_id, :integer
  end
end

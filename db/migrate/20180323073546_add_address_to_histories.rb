class AddAddressToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :address, :string
  end
end

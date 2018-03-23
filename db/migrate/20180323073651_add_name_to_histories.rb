class AddNameToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :name, :string
  end
end

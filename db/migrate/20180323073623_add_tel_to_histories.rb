class AddTelToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :tel, :string
  end
end

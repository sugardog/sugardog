class AddZipcodeToHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :histories, :zipcode, :string
  end
end

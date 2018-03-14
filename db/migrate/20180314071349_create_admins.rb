class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :admin_mail
      t.string :admin_pass

      t.timestamps
    end
  end
end

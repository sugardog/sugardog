class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.float :discount
      t.integer :status

      t.timestamps
    end
  end
end

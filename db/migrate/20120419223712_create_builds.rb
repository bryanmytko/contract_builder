class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.integer :contract_id
      t.string :saved_state
      t.string :hourly_rate
			t.string :saved_state
			t.string :cms_type
      t.timestamps
    end
  end
end

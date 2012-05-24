class CreateContractAdditionals < ActiveRecord::Migration
  def change
    create_table :contract_additionals do |t|
      t.string :follow_up
      t.string :next_step
      t.integer :contract_id

      t.timestamps
    end
  end
end

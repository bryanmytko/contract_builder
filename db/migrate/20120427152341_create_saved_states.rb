class CreateSavedStates < ActiveRecord::Migration
  def change
    create_table :saved_states do |t|
      t.integer :contract_id
      t.blob :data_string

      t.timestamps
    end
  end
end

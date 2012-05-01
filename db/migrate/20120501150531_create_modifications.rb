class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |t|
      t.integer :build_id
      t.string :page_type
      t.string :name
      t.string :hours
      t.string :cost
      t.string :description

      t.timestamps
    end
  end
end

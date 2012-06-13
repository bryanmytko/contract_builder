class CreateModificationPages < ActiveRecord::Migration
  def change
    create_table :modification_pages do |t|
      t.string :name
      t.string :hours
      t.string :cost
      t.text :description
      t.string :cms_type
      t.string :feature_type
      t.integer :build_id
      t.integer :template_id

      t.timestamps
    end
  end
end

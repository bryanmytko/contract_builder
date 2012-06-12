class CreateProfessionalPages < ActiveRecord::Migration
  def change
    create_table :professional_pages do |t|
      t.string :name
      t.string :hours
      t.string :cost
      t.string :cms_type
      t.string :feature_type
      t.string :description

      t.timestamps
    end
  end
  
  def up
      change_column :professional_pages, :description, :text
  end
end

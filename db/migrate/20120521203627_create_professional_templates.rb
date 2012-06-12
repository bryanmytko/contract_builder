class CreateProfessionalTemplates < ActiveRecord::Migration
  def change
    create_table :professional_templates do |t|
      t.string :name
      t.string :hours
      t.string :page_type
      t.string :description

      t.timestamps
    end
  end
  def up
      change_column :professional_templates, :description, :text
  end
end

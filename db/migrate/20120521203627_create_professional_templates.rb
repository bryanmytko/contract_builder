class CreateProfessionalTemplates < ActiveRecord::Migration
  def change
    create_table :professional_templates do |t|
      t.string :name
      t.string :hours
      t.string :page_type
      t.text :description

      t.timestamps
    end 
  end
end

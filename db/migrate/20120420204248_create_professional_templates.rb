class CreateProfessionalTemplates < ActiveRecord::Migration
  def self.up
    create_table :professional_templates do |t|
      t.string :name
      t.string :hours
      t.string :page_type

      t.timestamps
    end
  end
end

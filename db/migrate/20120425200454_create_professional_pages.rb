class CreateProfessionalPages < ActiveRecord::Migration
  def change
    create_table :professional_pages do |t|
      t.string :name
      t.string :hours
      t.string :cost
      t.string :cms_type
      t.string :feature_type
      t.text :description

      t.timestamps
    end
  end
end

class AddDescriptionToProfessionalTemplate < ActiveRecord::Migration
  def change
    add_column :professional_templates, :description, :string

  end
end

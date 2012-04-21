class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :company
      t.string :address
      t.string :name
      t.string :email
      t.string :phone
      t.string :url
      t.string :contract_type

      t.timestamps
    end
  end
end

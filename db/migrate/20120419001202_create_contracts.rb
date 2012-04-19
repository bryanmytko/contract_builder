class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :company
      t.string :address
      t.string :name
      t.string :email
      t.string :phone
      t.string :url
      t.string :type

      t.timestamps
    end
  end
end

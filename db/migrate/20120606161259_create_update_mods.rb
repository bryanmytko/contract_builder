class CreateUpdateMods < ActiveRecord::Migration
  def change
    change_column :modifications, :description, :text
    change_column :modification_pages, :description, :text
  end
end

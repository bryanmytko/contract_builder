class UpdateMods < ActiveRecord::Migration
  
def up
    change_column :modifications, :description, :text
    change_column :modification_pages, :description, :text
end

def down
    # This might cause trouble if you have strings longer
    # than 255 characters.
    #change_column :your_table, :your_column, :string
end

end
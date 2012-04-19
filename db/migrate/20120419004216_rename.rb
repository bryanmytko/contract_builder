class Rename < ActiveRecord::Migration

    def self.up
    rename_column :contracts, :type, :contract_type
    end

    def self.down
    rename_column :contracts, :type, :contract_type
    end
    
end

class AddContractUser < ActiveRecord::Migration
  def change
    add_column :contracts, :user_owner, :string
  end
end

class ChangeStringToText < ActiveRecord::Migration
  def up
    change_column :builds, :saved_state, :text, :limit => nil
  end

  def down
  end
end

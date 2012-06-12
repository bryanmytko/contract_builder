class ChangeStringToText < ActiveRecord::Migration
  def up
    change_column :builds, :saved_state, :text, :limit => nil
    change_column :professional_templates, :description, :text
  end

  def down
  end
end

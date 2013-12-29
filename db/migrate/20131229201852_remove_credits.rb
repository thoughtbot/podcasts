class RemoveCredits < ActiveRecord::Migration
  def up
    remove_column :shows, :credits
  end

  def down
    add_column :shows, :credits, :text, default: '', null: false
  end
end

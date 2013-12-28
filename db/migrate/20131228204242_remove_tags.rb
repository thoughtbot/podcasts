class RemoveTags < ActiveRecord::Migration
  def up
    remove_column :episodes, :tags
  end

  def down
    add_column :episodes, :tags, :string
  end
end

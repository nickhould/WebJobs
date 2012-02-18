class RemoveIdFromLineItems < ActiveRecord::Migration
  def self.up
    remove_column :line_items, :id
  end

  def self.down
    add_column :line_items, :id, :integer
  end
end

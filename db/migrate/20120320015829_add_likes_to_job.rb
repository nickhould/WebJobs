class AddLikesToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :likes, :integer
  end

  def self.down
    remove_column :jobs, :likes
  end
end

class RemoveSourceFromJob < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :source
  end

  def self.down
    add_column :jobs, :source, :string
  end
end

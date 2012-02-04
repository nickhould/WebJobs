class AddSourceToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :source, :string
  end

  def self.down
    remove_column :jobs, :source
  end
end

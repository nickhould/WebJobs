class RemoveScrapperIdFromJobs < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :scrapper_id
  end

  def self.down
    add_column :jobs, :scrapper_id, :integer
  end
end

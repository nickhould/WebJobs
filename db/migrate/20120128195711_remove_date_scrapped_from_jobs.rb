class RemoveDateScrappedFromJobs < ActiveRecord::Migration
  def self.up
    remove_column :jobs, :date_scrapped
  end

  def self.down
    add_column :jobs, :date_scrapped, :date
  end
end

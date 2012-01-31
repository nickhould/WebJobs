class AddDateScrappedToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :date_scrapped, :datetime
  end

  def self.down
    remove_column :jobs, :date_scrapped
  end
end

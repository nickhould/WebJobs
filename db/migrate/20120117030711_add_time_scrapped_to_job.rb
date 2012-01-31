class AddTimeScrappedToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :time_scrapped, :datetime
  end

  def self.down
    remove_column :jobs, :time_scrapped
  end
end

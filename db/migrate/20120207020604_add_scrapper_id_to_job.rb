class AddScrapperIdToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :scrapper_id, :integer
  end

  def self.down
    remove_column :jobs, :scrapper_id
  end
end

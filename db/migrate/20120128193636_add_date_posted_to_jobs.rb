class AddDatePostedToJobs < ActiveRecord::Migration
  def self.up
    add_column :jobs, :date_posted, :date
  end

  def self.down
    remove_column :jobs, :date_posted
  end
end

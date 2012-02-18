class AddJobIdToScrappers < ActiveRecord::Migration
  def self.up
    add_column :scrappers, :job_id, :integer
  end

  def self.down
    remove_column :scrappers, :job_id
  end
end

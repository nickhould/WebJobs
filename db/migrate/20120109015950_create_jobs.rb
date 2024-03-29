class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :business
      t.string :job_url
      t.date :date_scrapped

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end

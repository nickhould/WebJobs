class Job < ActiveRecord::Base
  validates_uniqueness_of :title, :scope => [:date_posted, :business, :job_url]
    
end

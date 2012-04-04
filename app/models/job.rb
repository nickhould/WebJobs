class Job < ActiveRecord::Base
  validates_uniqueness_of :title, :scope => [:date_posted, :business]
  
  default_scope :order => "date_posted DESC"
  
  #Scrappers
  has_many :line_items
  has_many :scrappers, :through => :line_items 
  
  #Tags
  acts_as_taggable
  acts_as_taggable_on :tags
  scope :by_join_date, order("created_at DESC")
  
  def self.promo_true
    User.find(self.joins.find_by_promo(true).user_id)
  end
  
  def self.promo_false
    User.find(self.joins.find_all_by_promo(false))
  end
  
  def check_if_job_exist
    job = Job.find_or_create_by_title_and_business(:title => self.title, :business => self.business)
  end
  
end

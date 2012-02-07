class Job < ActiveRecord::Base
  attr_accessible :tile, :business
  validates_uniqueness_of :title, :scope => [:date_posted, :business, :job_url]
  has_many :line_items
  has_many :scrappers, :through => :line_items 

  def self.promo_true
    User.find(self.joins.find_by_promo(true).user_id)
  end
  
  def self.promo_false
    User.find(self.joins.find_all_by_promo(false))
  end
end

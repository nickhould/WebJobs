class Scrapper < ActiveRecord::Base
  
  attr_accessible :title, :image_url
  
 has_many :line_items
 has_many :jobs, :through => :line_item
end

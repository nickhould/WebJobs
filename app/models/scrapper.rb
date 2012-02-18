class Scrapper < ActiveRecord::Base
 has_many :line_items
 has_many :jobs, :through => :line_item
end

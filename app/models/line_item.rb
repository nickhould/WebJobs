class LineItem < ActiveRecord::Base
  belongs_to :scrapper
  belongs_to :job
end

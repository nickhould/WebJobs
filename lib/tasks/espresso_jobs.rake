desc "Fetch Espresso Jobs"

task :fetch_jobs => :environment do
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  # Coder can define te number of pages to scrape
  number_of_pages_to_scrape = 1

  # Define varible and hash
  page_number = 1
  months = {"Jan" => 1, 
            "Feb" => 2,
            "Mar" => 3,
            "Avr" => 4,
            "Mai" => 5,
            "Jun" => 6,
            "Jul" => 7,
            "Aug" => 8,
            "Sep" => 9,
            "Oct" => 10,
            "Nov" => 11,
            "Dec" => 12}
  
            
  # Scrapper in action            
  while page_number < number_of_pages_to_scrape+1 do

    page = Nokogiri::HTML(open("http://www.espresso-jobs.com/page/#{page_number}/"))  
    page.css('html body div#wrapper2 div#wrapper div#content-wrapper div#content div.post-wrapper').each do |post|
      title = post.css('div span.titles a').text
      job_url = post.css('div span.titles a').attribute("href").text
      business = post.css('table a').text
      day_posted = post.css('div.date span.day').text
      month_posted = months[post.css('div.date span.month').text].to_s
      year_posted = Time.now.year.to_s
      date_posted =  year_posted + '-' + month_posted + '-' + day_posted
      if !business.empty?
        job = Job.create(:title     => title.capitalize,
                         :business  => business.capitalize,
                         :date_scrapped => Time.now,
                         :date_posted => date_posted,
                         :job_url       => job_url,
                         :time_scrapped => Time.now.gmtime,
                         :scrapper_id => 1)
        
        line_item = LineItem.create(:job_id => job.id,
                                    :scrapper_id => 1)
      end
      
      
      
    end   
    page_number += 1
  end
end
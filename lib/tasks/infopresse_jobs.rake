# encoding: utf-8

desc "Fetch Espresso Jobs"
task :fetch_infopresse_jobs => :environment do

  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'


  #Define variables and hashes
  root_url = "http://www3.infopresse.com"
  months = {"janvier" => 1, 
            "février" => 2,
            "mars" => 3,
            "avril" => 4,
            "mai" => 5,
            "juin" => 6,
            "juillet" => 7,
            "août" => 8,
            "septembre" => 9,
            "octobre" => 10,
            "novembre" => 11,
            "décembre" => 12}


  x = 1
  #Scrapper in action  
  page = Nokogiri::HTML(open("http://www3.infopresse.com/jobs/"))  
  page.css('html body #wraper #page #main #main-inner #content-area div div.view-content ul.liste-postes li').each do |post|
  

    # Little Hack to determine if the correct «li» was selected.
    day_posted = post.css('span.bg-block-job dl.clear-block dd.job-regular span.job-info ul li span.jour').text
    if day_posted != "" 
    
      #Fetching the date the job was posted
      date_posted_raw = post.css('span.bg-block-job dl.clear-block dd.job-regular li.job-date span').text    
      date_posted_raw =~ %r{(\d{1,2}).(\D*).(\d{4})}
      day_posted = date_posted_raw[$1]
      month_posted_raw = date_posted_raw[$2]
      year_posted = date_posted_raw[$3]
      month_posted = months[month_posted_raw.strip.to_s]
      date_posted =  year_posted + '-' + month_posted.to_s + '-' + day_posted.to_s  
    
      #Fetching the rest of the variables 
      title = post.css('span.bg-block-job dl.clear-block dd.job-regular span.job-info ul li.job-title a').text
      job_url_directory = post.css('span.bg-block-job dl.clear-block dd.job-regular span.job-info ul li.job-title a').attribute("href").text
      raw_business = post.css('span.bg-block-job dl.clear-block dd.job-regular span.job-info ul li.job-company').text
      raw_business =~ %r{(.*)\s\/(.*)}
      business =  raw_business[$1]
      city = raw_business[$2]
      job_url = root_url.to_s + job_url_directory.to_s
      
      #Creating the job
      job = Job.create(:title     => title.capitalize,
                       :business  => business.capitalize,
                       :date_scrapped => Time.now,
                       :job_url       => job_url,
                       :time_scrapped => Time.now.gmtime,
                       :date_posted => date_posted,
                       :scrapper_id => 3)
      
    
      #Creating the line item
      line_item = LineItem.create(:job_id => job.id,
                                  :scrapper_id => 3)

    end
  end
end
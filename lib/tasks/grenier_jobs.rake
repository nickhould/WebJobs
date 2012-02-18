# encoding: utf-8

desc "Fetch Grenier Jobs"

task :fetch_grenier_jobs => :environment do
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  
  # encoding: utf-8



  #Define variables and hashes
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



  #Scrapper in action  
  page = Nokogiri::HTML(open("http://www.grenier.qc.ca/emplois"))  
  page.css('html body.emplois div#bg_shadow div#container div#wrapper.clearfix div#content.clearfix div#main.list ul#emplois_postings li').each do |post|

    #Scrapping the H4 tag
    scrapped_h4 = post.css('h4 a').text

    #Parsing the H4 tag to split the job title and the business
    scrapped_h4 =~  %r{(.*)\s\|\s(.*)}

    #Defining the variables
    title = scrapped_h4[$2]
    business = scrapped_h4[$1]
    job_url = post.css('h4 a').attribute("href").text

    #Scrapping the date tag
    scrapped_raw_date = post.css('span.date').text

    #Parsing the date tag to split the day, the month and the year
    scrapped_raw_date =~ %r{\D*\s(\d*)\s(\D*)\s(\d*)\s\|\s(.*)}
    day_posted_raw = scrapped_raw_date[$1]
    month_posted_raw =  scrapped_raw_date[$2]
    year_posted = scrapped_raw_date[$3]
    city_posted = scrapped_raw_date[$4]

    #Treating the day variable
    day_posted_raw =~ %r{(\d)(\d)}

    if day_posted_raw[$1].to_i == 0 
      day_posted = day_posted_raw[$2]
    else
      day_posted = day_posted_raw[$1] + day_posted_raw[$2]
    end

    #Treating the month variable
    month_posted = months[month_posted_raw.to_s]

    #Define date posted
    date_posted =  year_posted.to_s + '-' + month_posted.to_s + '-' + day_posted.to_s
    
    if !business.empty?
      job = Job.create(:title     => title.capitalize,
                       :business  => business.capitalize,
                       :date_scrapped => Time.now,
                       :job_url       => job_url,
                       :time_scrapped => Time.now.gmtime,
                       :date_posted => date_posted,
                       :scrapper_id => 2)
    end
    
     line_item = LineItem.create(:job_id => job.id,
                                  :scrapper_id => 2)
                              
  end
end

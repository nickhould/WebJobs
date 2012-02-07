# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Scrapper.create(:title => "Espresso-Jobs", 
                :source =>"http://www.espresso-jobs.com/",
                :task => "fetch_jobs",
                :image_url => "espresso_icon.png")
                
Scrapper.create(:title => "Grenier aux Emplois", 
                :source =>"http://www.grenier.qc.ca/emplois",
                :task => "fetch_grenier_jobs",
                :image_url => "espresso_icon.png")
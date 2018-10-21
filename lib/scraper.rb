require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    list = Nokogiri::HTML(html)
    students = []
    
    # name, location, profile_url
    
    list.css(".student-card").each do |student|
      details = {}
      details[:name] = student.css(".student-name").text 
      details[:location] = student.css(".student-location").text 
      details[:profile_url] = list.css(".student-card a[href]")  
      students << details
    end
    students
    # binding.pry
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    page = Nokogiri::HTML(html)
    
   
  end

end


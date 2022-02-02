require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    url = "http://learn-co-curriculum.github.io/site-for-scraping/courses"
    doc = Nokogiri::HTML(open(url))
  end

  def get_courses
    self.get_page.css(".post")
  end

  def make_courses
    self.get_courses.each do |c|
      course = Course.new
      course.title = c.css("h2").text.strip
      course.schedule = c.css(".date").text.strip
      course.description = c.css("p").text.strip
    end
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end

Scraper.new.get_page




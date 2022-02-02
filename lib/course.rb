class Course
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize  #(title:, schedule:, description:)
    # @title = title
    # @schedule = schedule
    # @description = description

    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.print_courses
    courses = []
    self.all.each do |course|
      courses << course.title
    end
    courses
  end

end




# Course.new(title: "English", schedule: "PT", description: "a language to speak")
# Course.new(title: "French", schedule: "FT", description: "a language from a European country")
# Course.new(title: "Math", schedule: "FT", description: "working with numbers")
# Course.new(title:"Science", description: "understanding the world", schedule: "PT")

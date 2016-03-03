require 'open-uri'

class Studio < ActiveRecord::Base
  has_many :spin_classes
  has_many :users

  def get_current_classes_noko
    page = open("#{self.link}").read
    noko = Nokogiri::HTML(page)
    hash = noko.css("div[data-date]").css(".column-day").each_with_object({}) do |day, hash|
      hash[day.attributes["data-date"].value] = day.search('.open')
    end
    hash
  end

  def get_classes
    week_of_classes = get_current_classes_noko.each_with_object({}) do |(day, noko_hash), hash|
      day_array = get_a_days_classes(day, noko_hash)
      hash[day_array[0]] = day_array[1]
    end
    week_of_classes
  end

  def get_a_days_classes(day, noko_hash)
    month = get_month(day)

    hash = noko_hash.each_with_object({}) do |class_listing, hash|
      time = class_listing.search('.time').text
      instructor = Instructor.find_or_create_by(name: class_listing.search('.instructor').children.children.text)
      hash[time] = instructor
    end

    spin_class_objects = hash.each_with_object([]) do |(time, instructor), array|
      array << SpinClass.find_or_create_by(studio_id: self.id, time: time, instructor_id: instructor.id, month_and_day: "#{month} #{day}", strict_date: Date.parse("#{month} #{day}"))
    end

    ["#{month} #{day}", spin_class_objects]
    #ex:("January 11", [SpinClass1, SpinClass2])

  end

  def get_month(day)
    date = day.to_i
    today = Time.now.day

    if (date >= today) && (today >= 3)
      month = Date.today.strftime("%B")
    elsif (date >= today) && (today < 3)
      last_month = Time.now - 1.month 
      month = last_month.strftime("%B") 
    elsif (date < today) && (today - date > 3)
      next_month = Time.now + 1.month 
      month = next_month.strftime("%B")
    else
      month = Date.today.strftime("%B") 
    end
  end

end

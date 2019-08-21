require 'date'
require_relative 'birthday'

class BirthdayList
  attr_accessor :birthdays
  def initialize(birthday_class = Birthday)
    @birthdays = []
    @birthday_class = birthday_class
  end

  def add_birthday(name, birthday)
    @birthdays << @birthday_class.new(name, birthday)
  end

  def print
    @birthdays.each { |birthday|
      puts "#{birthday.name}: #{birthday.birthday}"
    }
  end

  def birthdays_today
    @birthdays.each { |birthday|
      puts "It's #{birthday.name}'s birthday today! They are #{birthday.age} years old!" if today?(birthday)
    }
    nil
  end

  private

  def today?(birthday)
    birthday.birthday == Date.today
  end
end

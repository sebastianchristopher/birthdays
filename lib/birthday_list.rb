class BirthdayList
  attr_accessor :birthdays
  def initialize
    @birthdays = []
  end

  def add_birthday(birthday)
    @birthdays << birthday
  end

  def print
    @birthdays.each { |birthday| puts "#{birthday.name}: #{birthday.birthday}" }
  end

  def birthdays_today
    @birthdays.each { |birthday| puts "It's #{birthday.name}'s birthday today! They are #{birthday.age} years old!" if birthday.birthday == Date.today }
    nil
  end
end

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
end

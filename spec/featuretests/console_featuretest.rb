require_relative '../../lib/birthday_list'

birthdays = BirthdayList.new
birthdays.add_birthday('Chris', Date.new(1989, 1, 4))
birthdays.add_birthday('Mr Birthday', Date.today)

birthdays.print
birthdays.birthdays_today

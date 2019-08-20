require 'birthday_list'

describe BirthdayList do
  it 'can store birthdays' do
    birthday = double(:birthday)
    subject.add_birthday(birthday)
    expect(subject.birthdays).to include(birthday)
  end
  it 'can print out the name and birthday of each stored birthday' do
    chris = double(:chris, name: 'Chris', birthday: Date.new(1989, 01, 04))
    jesus = double(:jesus, name: 'Jesus', birthday: Date.new(0000, 12, 25))
    subject.add_birthday(chris)
    subject.add_birthday(jesus)
    expect { subject.print }.to output("Chris: 1989-01-04\nJesus: 0000-12-25\n").to_stdout
  end
  it 'can find a birthday from birthdays that matches today' do
    birthday = double(:birthday, name: 'Mr Birthday', birthday: Date.today, age: 0)
    subject.add_birthday(birthday)
    expect { subject.birthdays_today }.to output("It's Mr Birthday's birthday today! They are 0 years old!\n").to_stdout
  end
  it 'returns nil if no birthdays today' do
    birthday = double(:birthday, name: 'Mr Nobody', birthday: Date.today + 1, age: 0)
    subject.add_birthday(birthday)
    expect(subject.birthdays_today).to be_nil
  end
end

require 'birthday_list'

describe BirthdayList do
  it 'can store birthdays' do
    birthday = double(:birthday)
    subject.add_birthday(birthday)
    expect(subject.birthdays).to include(birthday)
  end
  it 'can print out the name and birthday of each stored birthday' do
    chris = double(:chris, name: 'Chris', birthday: 'Jan-4')
    jesus = double(:jesus, name: 'Jesus', birthday: 'Dec-25')
    subject.add_birthday(chris)
    subject.add_birthday(jesus)
    expect { subject.print }.to output("Chris: Jan-4\nJesus: Dec-25\n").to_stdout
  end
end

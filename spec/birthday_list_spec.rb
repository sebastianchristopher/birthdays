require 'birthday_list'

describe BirthdayList do
  let(:birthday) { double(:birthday) }
  let(:birthday_class) { double(:birthday_class, new: birthday) }
  subject(:subject) { described_class.new(birthday_class) }
  it 'can store birthdays' do

    subject.add_birthday('Foo', 'bar')
    expect(subject.birthdays).to include(birthday)
  end
  it 'can print out the name and birthday of each stored birthday' do
    allow(birthday).to receive(:name).and_return('Chris')
    allow(birthday).to receive(:birthday).and_return(Date.new(1989, 01, 04))
    subject.add_birthday('Chris', Date.new(1989, 01, 04))
    expect { subject.print }.to output("Chris: 1989-01-04\n").to_stdout
  end
  it 'can find a birthday from birthdays that matches today' do
    allow(birthday).to receive(:name).and_return('Mr Birthday')
    allow(birthday).to receive(:birthday).and_return(Date.today)
    allow(birthday).to receive(:age).and_return(0)
    subject.add_birthday('Mr Birthday', Date.today)
    expect { subject.birthdays_today }.to output("It's Mr Birthday's birthday today! They are 0 years old!\n").to_stdout
  end
  it 'returns nil if no birthdays today' do
    allow(birthday).to receive(:birthday)
    subject.add_birthday('Mr Nobody', Date.today + 1)
    expect(subject.birthdays_today).to be_nil
  end
end

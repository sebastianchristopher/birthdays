require 'birthday'
require 'date'

describe Birthday do
  subject(:subject) { described_class.new('Chris', Date.new(1989, 01, 04)) }
  it 'has a name' do
    expect(subject.name).to eq('Chris')
  end
  it 'has a date' do
    expect(subject.birthday).to eq(Date.new(1989, 01, 04))
  end
  it 'can calculate age from dob' do
    birthday = described_class.new('Person', Date.today)
    expect(birthday.age).to eq(0)
  end
  it 'can return the number of days until next birthday' do
    birthday = described_class.new('Person', Date.today.next_day)
    expect(birthday.days_until).to eq(1)
  end
end

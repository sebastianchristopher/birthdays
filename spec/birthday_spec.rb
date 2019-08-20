require 'birthday'

describe Birthday do
  subject(:subject) { described_class.new('Chris', 'Jan-4') }
  it 'has a name' do
    expect(subject.name).to eq('Chris')
  end
  it 'has a date' do
    expect(subject.birthday).to eq('Jan-4')
  end
end

require 'capybara/rspec'

feature "homepage" do
  context "birthday is today" do
    scenario 'I should be able to enter my name and dob and see a page saying happy birthday' do
      visit '/'
      fill_in :name, with: 'Chris'
      fill_in :birthday, with: Date.today
      click_button 'Submit'
      expect(page).to have_content('Happy Birthday Chris!')
    end
  end
  context "birthday is not today" do
    scenario 'I should be able to enter my name and dob and see a page telling me the number of days until my birthday' do
      visit '/'
      fill_in :name, with: 'Chris'
      fill_in :birthday, with: Date.today.prev_day
      click_button 'Submit'
      expect(page).to have_content('Your birthday will be in 1 days, Chris.')
    end
  end
  context "no data is entered" do
    scenario 'I should see the home screen' do
      visit '/'
      click_button 'Submit'
      expect(page).to have_content('Enter name')
    end
  end
end

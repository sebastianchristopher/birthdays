require 'capybara/rspec'

feature "homepage" do
  context "birthday is today" do
    scenario 'I should be able to enter my name and dob and see a page saying happy birthday' do
      visit '/'
      fill_in :name, with: 'Chris'
      fill_in :birthday, with: Date.today.strftime('%d-%m-%Y')
      click_button 'Submit'
      expect(page).to have_content('Happy Birthday Chris!')
    end
  end
  context "birthday is not today" do
    scenario 'I should be able to enter my name and dob and see a page telling me the number of days until my birthday' do
      visit '/'
      fill_in :name, with: 'Chris'
      fill_in :birthday, with: Date.today.next_day.strftime('%d-%m-%Y')
      click_button 'Submit'
      expect(page).to have_content('Your birthday will be in 1 days, Chris.')
    end
  end
  context "no data is entered" do
    scenario 'I should see the home screen and a prompt' do
      visit '/'
      click_button 'Submit'
      expect(page).to have_content('Please enter a name and DOB (dd-mm-yyyy)')
    end
  end
  context "shorthand date (dd-mm-yy) is entered" do
    scenario 'I should see the home screen and a prompt' do
      visit '/'
      fill_in :name, with: 'Chris'
      fill_in :birthday, with: '04-01-89'
      click_button 'Submit'
      expect(page).to have_content('Please enter a name and DOB (dd-mm-yyyy)')
    end
  end
end

require 'rails_helper'
describe 'The entry feature' do
  it 'should allow a user to create an entry', js: true do
    profile = FactoryGirl.create(:user_profile)
    login_as(profile.user, scope: :user)
    visit  user_profile_path(profile)
    choose 'entry_work_3'
    choose 'entry_social_3'
    choose 'entry_education_3'
    choose 'entry_health_3'
    #fill_in 'Date', with: '09/14/1994'
    select 'Sept', from: 'entry_date_2i'
    select "14", from: 'entry_date_3i'
    select "2016", from: 'entry_date_1i'
    click_on 'Create Entry'
    expect(page).to have_content('09/14/2016')
  end
end

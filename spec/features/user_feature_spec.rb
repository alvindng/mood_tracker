require 'rails_helper'

describe 'The User feature' do

  it 'should allow a user to sign up' do
    visit new_user_registration_path
    fill_in 'Email', with: 'Musashi@Miyomoto.com'
    fill_in 'Password', with: 'welcome'
    fill_in 'Password confirmation', with: 'welcome'
    click_on 'Sign up'
    expect(page).to have_current_path(new_user_profile_path)
  end

  it 'should allow user to sign in' do
    user = FactoryGirl.create :user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'welcome'
    click_on 'Log in'
    expect(page).to have_content('musashi')
  end
end

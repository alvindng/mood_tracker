require 'rails_helper'

describe 'The User profile feature' do

  it 'should allow a user to create a user profile' do
    user = FactoryGirl.create :user
    login_as(user, scope: :user)
    visit new_user_profile_path
    fill_in 'Name', with: 'Musashi'
    fill_in 'Age', with: '32'
    click_on 'Create User profile'
    expect(page).to have_content('Musashi')
  end

  # it 'should allow user to sign in' do
  #   user = FactoryGirl.create :user
  #   visit new_user_session_path
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: 'welcome'
  #   click_on 'Log in'
  #   expect(page).to have_content('musashi')
  # end
end

require 'rails_helper'

feature 'User can sees your profile' do
  given(:user) { create(:user) }
  given(:profile) { create(:profile, user_id: user.id) }

  describe 'Authenticated user', js: true do
    background do
      sign_in(user)
      visit root_path
    end

    scenario 'sees your profile' do
      expect(page).to have_content("Логин")
      expect(page).to have_content user.username
    end
  end


  describe 'Unauthenticated user', js: true do
    background do
      visit profile_path(profile)
    end

    scenario 'can not see profile' do
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end
end

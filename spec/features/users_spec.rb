require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  scenario "login as a authenticated user" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_current_path root_path
  end

  scenario "authenticated user logged out from root_path" do
    sign_in user
    visit root_path
    within '.btn-position' do
      click_on "Log out"
    end
    expect(page).to have_content "Signed out successfully."
    expect(current_path).to eq root_path
    expect(page).to have_selector 'h1', text: "Welcome to \"100Days of Training\"!"
  end

  scenario "authenticated user change Account Name and Email" do
    sign_in user
    visit root_path
    within '.btn-position' do
      click_on 'Edit Account'
    end
    expect(current_path).to eq edit_user_registration_path
    fill_in "user_name", with: "Edit User"
    fill_in "user_email", with: "edit_user@example.com"
    fill_in "user_current_password", with: user.password
    click_button "Update"
    expect(page).to have_content "Your account has been updated successfully."
    expect(current_path).to eq root_path
  end

  scenario "access to user page as a guest" do
    visit user_path(user.id)
    expect(current_path).to eq new_user_session_path
    visit users_path
    expect(page).to have_css '.alert-alert'
    expect(current_path).to eq new_user_session_path
  end

  scenario "render users/index" do
    sign_in user
    visit users_path
    expect(page).to have_current_path "/users"
  end

  scenario "render other user's page" do
    sign_in user
    visit user_path(other_user.id)
    expect(page).to have_current_path user_path(other_user.id)
    expect(page).to have_css ".col-md-5.p-lg-5.mx-auto.my-5"
    expect(page).to have_css ".card"
  end
end

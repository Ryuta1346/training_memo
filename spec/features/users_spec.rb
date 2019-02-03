require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  scenario "render users/index" do
    visit users_path
    expect(page).to have_css '.alert-alert'
    expect(page).to have_current_path new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_current_path root_path
    visit users_path
    expect(page).to have_css ".card-users"
  end

  scenario "render user page" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit user_path(other_user.id)
    expect(page).to have_css ".col-md-5.p-lg-5.mx-auto.my-5"
    expect(page).to have_css ".card"
  end
end

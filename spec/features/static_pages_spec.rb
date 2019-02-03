require 'rails_helper'
RSpec.feature "StaticPages", type: :feature do
  let!(:user) { create(:user, id: 2) }
  let!(:user2) { build(:user) }
  let!(:post) { create(:post, weight: 65.5, training: "New Training", user: user) }

  scenario "access to home as a guest" do
    visit root_path
    expect(page).to have_current_path root_path
    expect(page).to have_title "100Days Of Training"
    within '#navbarSupportedContent' do
      expect(page).to have_content "Home"
      expect(page).to have_content "ABOUT"
      expect(page).to have_content "HELP"
      expect(page).to have_content "CONTACT"
    end
    within '.top-page' do
      within 'h1' do
        expect(page).to have_content "Welcome to \"100Days of Training\"!"
      end
      expect(page).to have_content "Sign Up Now!"
      expect(page).to have_content "Log In"
    end
  end

  scenario "display about page" do
    visit root_path
    expect(page).to have_current_path root_path
    within '#navbarSupportedContent > ul > li:nth-child(2)' do
      click_link "ABOUT"
    end
    expect(page).to have_current_path about_path
    find_link "@all_akumasan"
  end

  scenario "display help page" do
    visit root_path
    expect(page).to have_current_path root_path
    within '#navbarSupportedContent > ul > li:nth-child(3)' do
      click_link "HELP"
    end
    expect(page).to have_current_path help_path
  end

  scenario "display contact page" do
    visit root_path
    expect(page).to have_current_path root_path
    within '#navbarSupportedContent > ul > li:nth-child(4)' do
      click_link "CONTACT"
    end
    expect(page).to have_current_path contact_path
    find_link "@all_akumasan"
  end

  scenario "creates new user" do
    visit root_path
    expect(page).to have_current_path root_path
    click_link "Sign Up Now!"
    expect(page).to have_current_path " /users/sign_up"
    expect do
      fill_in "Name", with: user2.name
      fill_in "Email", with: user2.email
      fill_in "Password", with: user2.password
      fill_in "Password Confirmation", with: user2.password_confirmation
      fill_in "開始時の体重", with: user2.weight
      fill_in "身長(*m表記)", with: user2.height
      fill_in "目標体重", with: user2.aim
      click_button "Sign up"

      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(page).to have_current_path root_path
    end.to change(User, :count).by(1)
  end

  scenario "sign in as authenticated user" do
    visit root_path
    click_link "Log In"
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_link "Sign up"
    expect(page).to have_link "Forgot your password?"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_current_path root_path

    within '.col-md-5.p-lg-5.mx-auto.my-5' do
      expect(page).to have_content user.name
      expect(page).to have_content "目標:#{user.aim}kg"
      expect(page).to have_content "達成まで:#{user.posts.first.weight - user.aim}kg"
    end

    within '.start-info' do
      expect(page).to have_content user.started_at
      expect(page).to have_content user.weight
      expect(page).to have_content "#{(user.weight / (user.height ** 2)).round(2)}%"
      expect(page).to have_content "#{(Date.today - user.started_at + 1).to_i}/100日目"
      expect(page).to have_content user.weight
      expect(page).to have_content "#{(user.weight / (user.height ** 2)).round(2)}%"
    end

    within '.btn-position' do
      expect(page).to have_link "Edit Account"
      expect(page).to have_link "Log out"
      expect(page).to have_link "Delete Account"
    end

    within '.post-form' do
      expect(page).to have_content "#{(Date.today - user.started_at + 1).to_i}/100日目"
      expect(page).to have_css '#post_weight'
      expect(page).to have_css '#post_image'
      expect(page).to have_css '#post_morning'
      expect(page).to have_css '#post_lunch'
      expect(page).to have_css '#post_dinner'
      expect(page).to have_css '#post_training'
      expect(page).to have_css '#post_content'
      expect(page).to have_css '#post_date_1i'
      expect(page).to have_css '#post_date_2i'
      expect(page).to have_css '#post_date_3i'
    end

    within '.card-body' do
      expect(page).to have_css '.card-title'
      expect(page).to have_content user.posts.first.date
      expect(page).to have_content user.posts.first.weight
    end
  end
end

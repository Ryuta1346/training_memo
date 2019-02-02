require 'rails_helper'
RSpec.feature "StaticPages", type: :feature do

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
end

require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  before do
    visit posts_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end

  scenario "render posts/index" do
    visit posts_path
    expect(page).to have_current_path posts_path
  end

  scenario "render post page" do
    visit post_path(post.id)
    expect(page).to have_current_path post_path(post.id)
    within '.card-text' do
      expect(page).to have_content post.date
      expect(page).to have_content post.weight
      expect(page).to have_content "#{(post.weight/ (user.height**2)).round(2)}%"
      expect(page).to have_content post.training
      expect(page).to have_content post.morning
      expect(page).to have_content post.lunch
      expect(page).to have_content post.dinner
      expect(page).to have_content post.content
    end
    click_link "Return Home"
    expect(page).to have_current_path root_path
  end
end

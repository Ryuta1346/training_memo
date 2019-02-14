require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:other_post) { create(:post, user: other_user) }

  before do
    sign_in user
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
      expect(page).to have_content "#{(post.weight / (user.height ** 2)).round(2)}%"
      expect(page).to have_content post.training
      expect(page).to have_content post.morning
      expect(page).to have_content post.lunch
      expect(page).to have_content post.dinner
      expect(page).to have_content post.content
    end
    click_link "Return Home"
    expect(page).to have_current_path root_path
  end

  scenario "post new training" do
    sign_in user
    visit root_path
    fill_in "post_weight", with: post.weight
    # fill_in "post_image", with: "crossfit-medium.jpg"
    fill_in "post_morning", with: post.morning
    fill_in "post_lunch", with: post.lunch
    fill_in "post_dinner", with: post.dinner
    fill_in "post_training", with: post.training
    fill_in "post_content", with: post.content
    select "2019", from: "post_date_1i"
    select "January", from: "post_date_2i"
    select "1", from: "post_date_3i"
    expect { click_button "Post" }.to change(Post, :count).by(1)
    expect(page).to have_content "Post created!"
    expect(page).to have_current_path root_path
  end

  scenario "User create a post with blank" do
    sign_in user
    visit root_path
    click_button "Post"
    expect(page).to have_content "Post Not created!"
    expect(current_path).to eq root_path
  end
end

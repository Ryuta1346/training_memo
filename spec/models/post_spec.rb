require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    it "is valid with weight, date, training" do
      expect(create(:post)).to be_valid
    end

    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :training }

    it "is invalid that training is over 250 characters" do
      post = build(:post, training: "a" * 251)
      post.valid?
      expect(post.errors[:training]).to include("is too long (maximum is 250 characters)")
    end

    it "is invalid that content is over 250 characters" do
      post = build(:post, content: "a" * 251)
      post.valid?
      expect(post.errors[:content]).to include("is too long (maximum is 250 characters)")
    end
  end
end

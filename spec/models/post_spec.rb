require 'rails_helper'

RSpec.describe Post, type: :model do
  describe Post do
    # it "is invalid that a user has duplicate date per day." do
    #   post = create(:post, date: 2019-02-01)
    #   post = build(:post, date: 2019-02-01)
    #   post.valid?
    #   expect(post.errors[:date]).to include("SA")
    # end

    it "is valid with weight, date, training" do
      expect(build(:post)).to be_valid
    end

    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :date }
    it { is_expected.to validate_presence_of :training }

    # it "is invalid without weight" do
    #   post = build(:post, weight: nil)
    #   post.valid?
    #   expect(post.errors[:weight]).to include("can't be blank")
    # end
    #
    # it "is invalid without date" do
    #   post = build(:post, date: nil)
    #   post.valid?
    #   expect(post.errors[:date]).to include("can't be blank")
    # end
    #
    # it "is invalid without training" do
    #   post = build(:post, training: nil)
    #   post.valid?
    #   expect(post.errors[:training]).to include("can't be blank")
    # end

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

  pending "add some examples to (or delete) #{__FILE__}"
end

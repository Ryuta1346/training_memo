require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it "is valid with a name, email, and password, started_at, finished_at, height, weight, and aim" do
      expect(build(:user)).to be_valid
    end

    it { is_expected.to validate_presence_of :name }

    # it "is invalid without name" do
    #   user = build(:user, name: nil)
    #   user.valid?
    #   expect(user.errors[:name]).to include("can't be blank")
    # end
    #

    it { is_expected.to validate_presence_of :email }

    # it "is invalid without an email address" do
    #   user = build(:user, email: nil)
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    # it "is invalid with a duplicate email address" do
    #   user = create(:user, email: "test@example.com")
    #   user = build(:user, email: "test@example.com")
    #   user.valid?
    #   expect(user.errors[:email]).to include("has already been taken")
    # end


    it { is_expected.to validate_presence_of :password }

    # it "is valid without a password" do
    #   user = build(:user, password: nil)
    #   user.valid?
    #   expect(user.errors[:password]).to include("can't be blank")
    # end
    #

    it { is_expected.to validate_presence_of :started_at }
    it { is_expected.to validate_presence_of :aim }
    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :height }
  end


  pending "add some examples to (or delete) #{__FILE__}"
end

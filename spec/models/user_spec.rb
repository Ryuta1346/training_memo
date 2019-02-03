require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it "is valid with a name, email, and password, started_at, finished_at, height, weight, and aim" do
      expect(build(:user)).to be_valid
    end

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :started_at }
    it { is_expected.to validate_presence_of :aim }
    it { is_expected.to validate_presence_of :weight }
    it { is_expected.to validate_presence_of :height }
  end
end

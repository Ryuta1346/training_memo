require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it "has a valid factory" do
      expect(FactoryBot.build(:user)).to be_valid
    end



  end


  pending "add some examples to (or delete) #{__FILE__}"
end

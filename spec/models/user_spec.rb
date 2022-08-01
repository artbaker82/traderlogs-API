require 'rails_helper'

RSpec.describe User, type: :model do
  !let (:user) { FactoryBot.create(:user) }

  context "testing associations" do
    it "has many trading systems" do
      expect(user).to have_many(:trading_systems) 
    end
  end
end
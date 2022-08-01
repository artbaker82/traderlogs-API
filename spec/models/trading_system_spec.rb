require 'rails_helper'

RSpec.describe TradingSystem, type: :model do
  !let (:ts) { FactoryBot.create(:trading_system) }

  context "testing associations" do
    it "belongs to user" do
      expect(ts).to belong_to(:user) 
    end
  end
end
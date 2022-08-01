class TradingSystem < ApplicationRecord
  belongs_to :user
  has_many :trade_instances, dependent: :destroy
  validates :name, :cost_per_trade, :opportunity_month, :reliability, :expectancy, presence: true
  validates :expectancy, :cost_per_trade, :opportunity_month, :reliability, numericality: true
end

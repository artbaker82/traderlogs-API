class CreateTradingSystems < ActiveRecord::Migration[7.0]
  def change
    create_table :trading_systems, id: :uuid do |t|
      t.float :expectancy, null: false, default: 0
      t.float :reliability, null: false, default: 0
      t.integer :opportunity_month, null: false, default: 0
      t.float :cost_per_trade, null: false, default: 0
      t.belongs_to :user, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end

class CreateTradeInstances < ActiveRecord::Migration[7.0]
  def change
    create_table :trade_instances, id: :uuid do |t|
      t.belongs_to :trading_system, foreign_key: true, type: :uuid
      t.string :title
      t.string :security, null: false
      t.datetime :buy_date, null:false, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :sell_date
      t.float :buy_price, null:false
      t.float :sell_price
      t.float :num_shares
      t.float :r
      t.decimal :r_multiple
      t.text :reflection

      t.timestamps
    end
  end
end

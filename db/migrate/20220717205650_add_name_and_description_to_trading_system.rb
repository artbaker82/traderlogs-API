class AddNameAndDescriptionToTradingSystem < ActiveRecord::Migration[7.0]
  def change
    add_column :trading_systems, :name, :string, null: false
    add_column :trading_systems, :description, :text
  end
end

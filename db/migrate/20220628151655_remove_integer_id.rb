class RemoveIntegerId < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.remove :integer_id
    end
  end
end

class AddDefaultValueIsActiveToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    change_column_default :subscriptions, :is_active, true
  end
end

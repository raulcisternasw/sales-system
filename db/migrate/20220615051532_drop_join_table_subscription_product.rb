class DropJoinTableSubscriptionProduct < ActiveRecord::Migration[6.1]
  def change
    drop_join_table :subscriptions, :products
  end
end

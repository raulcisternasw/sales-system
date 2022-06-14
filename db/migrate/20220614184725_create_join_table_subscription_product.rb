class CreateJoinTableSubscriptionProduct < ActiveRecord::Migration[6.1]
  def change
    create_join_table :subscriptions, :products do |t|
      t.index :subscription_id
      t.index :product_id
    end
  end
end

class CreateSubscriptionsProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions_products do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.string :buy_order
      t.string :token
      t.decimal :amount
      t.integer :status
      t.string :card_number
      t.datetime :transaction_date
      t.integer :payment_type_code
      t.decimal :installments_amount
      t.integer :installments_number
      t.decimal :balance
      t.string :authorization_code
      t.datetime :authorization_date
      t.decimal :nullified_amount

      t.timestamps
    end
  end
end

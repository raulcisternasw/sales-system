json.extract! order, :id, :user_id, :subscription_id, :buy_order, :token, :amount, :status, :card_number, :transaction_date, :payment_type_code, :installments_amount, :installments_number, :balance, :authorization_code, :authorization_date, :nullified_amount, :created_at, :updated_at
json.url order_url(order, format: :json)

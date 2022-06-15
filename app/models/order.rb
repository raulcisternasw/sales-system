class Order < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  enum status: [:initialized, :authorized, :reversed, :failed, :nullified, :partially_nullified, :captured]
  enum payment_type_code: [:debit_sale, :normal_sale, :sale_installments, :three_installments_without_interest,
                           :two_installments_without_interest, :n_installments_without_interest, :prepaid_sale]
end

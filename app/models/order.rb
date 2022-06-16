class Order < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  enum status: [:initialized, :authorized, :reversed, :failed, :nullified, :partially_nullified, :captured]
  enum payment_type_code: [:debit_sale, :normal_sale, :sale_installments, :three_installments_without_interest,
                           :two_installments_without_interest, :n_installments_without_interest, :prepaid_sale]
  validates_uniqueness_of :user_id, conditions: -> { where(status: :authorized) }, if: Proc.new { |order| order.authorized? }, message: 'already has an order created.'
  after_create :generate_buy_order

  # Method to generate buy order
  def generate_buy_order
    self.buy_order = "sales-system-#{ self.id }"
  end

  # Method to generate session id
  def generate_session_id
    session_id = "session#{ rand(10000) }"
  end
end

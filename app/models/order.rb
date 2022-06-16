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

  # Method to generate return url
  def generate_return_url
    return_url = "http://localhost:3000/webpayplus/return_url"
  end

  # Set transaction_data in Order
  def set_transaction_data(transaction)
    self.card_number         = transaction.card_detail["card_number"] if transaction.card_detail.present?
    self.transaction_date    = transaction.transaction_date if transaction.transaction_date.present?
    self.installments_amount = transaction.installments_amount if transaction.installments_amount.present?
    self.installments_number = transaction.installments_number if transaction.installments_number.present?
    self.balance             = transaction.balance if transaction.balance.present?
    self.authorization_code  = transaction.authorization_code if transaction.authorization_code.present?
    self.authorization_date  = transaction.authorization_date if transaction.authorization_date.present?
    self.nullified_amount    = transaction.nullified_amount if transaction.nullified_amount.present?
    set_status(transaction.status) if transaction.status.present?
    set_payment_type_code(transaction.payment_type_code) if transaction.payment_type_code.present?
  end

  # Set status in Order
  def set_status(status)
    self.status = status.downcase.to_sym
  end

  # Set payment type code in Order
  def set_payment_type_code(payment_type_code)
    case payment_type_code
    when "VD"
      self.payment_type_code = :debit_sale
    when "VN"
      self.payment_type_code = :normal_sale
    when "VC"
      self.payment_type_code = :sale_installments
    when "SI"
      self.payment_type_code = :three_installments_without_interest
    when "S2"
      self.payment_type_code = :two_installments_without_interest
    when "NC"
      self.payment_type_code = :n_installments_without_interest
    when "VP"
      self.payment_type_code = :prepaid_sale
    end
  end
end

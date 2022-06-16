class Orders::Webpay
  # Method to create a transaction
  def self.create(buy_order, session_id, amount, return_url)
    transaction = Transbank::Webpay::WebpayPlus::Transaction.new
    response    = transaction.create(buy_order, session_id, amount, return_url)
    return response
  end
end

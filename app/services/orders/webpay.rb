class Orders::Webpay
  # Method to create a transaction
  def self.create(buy_order, session_id, amount, return_url)
    transaction = Transbank::Webpay::WebpayPlus::Transaction.new
    response    = transaction.create(buy_order, session_id, amount, return_url)
    return response
  end

  # Method to confirm a transaction
  def self.commit(token)
    transaction = Transbank::Webpay::WebpayPlus::Transaction.new
    response    = transaction.commit(token)
    return response
  end

  # Method to get status of a transaction
  def self.status(token)
    transaction = Transbank::Webpay::WebpayPlus::Transaction.new
    response    = transaction.status(token)
    return response
  end
end

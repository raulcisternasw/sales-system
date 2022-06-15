class Subscription < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :subscriptions_products, dependent: :destroy
  has_many :products, through: :subscriptions_products
  accepts_nested_attributes_for :subscriptions_products, allow_destroy: true
  after_save :calculate_total_amount

  def calculate_total_amount
    total_amount = products.sum(:price)
    update_column(:total_amount, total_amount)
  end
end

class Product < ApplicationRecord
  has_many :subscriptions_products, dependent: :destroy
  has_many :subscriptions, through: :subscriptions_products
  enum status: [:enabled, :disabled, :deprecated]
end

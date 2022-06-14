class Product < ApplicationRecord
  has_and_belongs_to_many :subscriptions
  enum status: [:enabled, :disabled, :deprecated]
end

class Product < ApplicationRecord
  enum status: [:enabled, :disabled, :deprecated]
end

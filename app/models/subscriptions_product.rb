class SubscriptionsProduct < ApplicationRecord
  belongs_to :subscription
  belongs_to :product
end

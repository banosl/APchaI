class Subscription < ApplicationRecord
  enum status: {active: 0, cancelled: 1}

  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :price, :status, :frequency
end
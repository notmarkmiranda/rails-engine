class Invoice < ActiveRecord::Base
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  belongs_to :customer
  has_many   :items, through: :invoice_items
  validates  :customer_id, presence: true
  validates  :merchant_id, presence: true
  validates  :status, presence: true
end

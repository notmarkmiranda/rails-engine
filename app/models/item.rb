class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :merchant_id, presence: true

  def self.ranked_revenue(qty)
    joins(:invoice_items).group(:id)
    .order('sum(invoice_items.unit_price * invoice_items.quantity)DESC')
    .limit(qty)
  end

  def self.ranked_items_sold(qty)
    joins(:invoice_items).group(:id)
    .order('sum(invoice_items.quantity) DESC').limit(qty)
  end
end

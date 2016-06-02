class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  validates :name, presence: true

  def self.ranked_revenue(qty)
    joins(:invoice_items).group(:id)
    .order('sum(invoice_items.unit_price * invoice_items.quantity)DESC')
    .limit(qty)
  end

  def self.ranked_items_sold(qty)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"}).group(:id)
    .order('sum(invoice_items.quantity) DESC').limit(qty)
  end

  def favorite_customer
    # require 'pry'; binding.pry
    customers.joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id).order('count(invoices.merchant_id)DESC')
    .first
  end

  def self.total_revenue(params)
    # require 'pry'; binding.pry
  end
end

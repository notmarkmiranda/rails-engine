class Customer < ActiveRecord::Base
  has_many  :invoices
  has_many  :merchants, through: :invoices
  has_many  :transactions, through: :invoices
  validates :first_name, presence: true
  validates :last_name, presence: true

  def favorite_merchant
    merchants.joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id).order('count(invoices.merchant_id)DESC')
    .first
  end

end

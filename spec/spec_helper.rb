require "simplecov"
SimpleCov.start("rails")

require 'database_cleaner'
require 'shoulda-matchers'
require 'capybara'
require 'launchy'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

def create_merchants(num = 1)
  num.times do
    Merchant.create(name: Faker::Company.name)
  end
end

def create_customers(num = 1)
  num.times do
    Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end
end

def create_items_with_five_merchants(num = 1)
  create_merchants(5)
  first = Merchant.first.id
  last = Merchant.last.id
  num.times do
    Item.create(name: Faker::Commerce.product_name,
                description: Faker::Hipster.paragraph,
                unit_price: Faker::Number.between(100, 25000),
                merchant_id: Random.new.rand(first..last))
  end
end

def create_invoices(num = 1)
  create_merchants(5)
  fmid = Merchant.first.id
  lmid = Merchant.last.id
  create_customers(5)
  fcid = Customer.first.id
  lcid = Customer.last.id
  num.times do
    Invoice.create(customer_id: Random.new.rand(fcid..lcid),
                   merchant_id: Random.new.rand(fmid..lmid),
                   status: "something")
  end
end

def create_transactions(num = 1)
  create_invoices(2)
  first = Invoice.first.id
  last = Invoice.last.id

  num.times do
    Transaction.create(invoice_id: Random.new.rand(first..last),
                       credit_card_number: "4242424242424242",
                       credit_card_exp: "05/18",
                       result: "sure")
  end
end

def create_invoice_items(num = 1)
  create_invoices(3)
  create_items_with_five_merchants(5)
  a = Random.new
  f_item, l_item = Item.first.id, Item.last.id
  f_invoice, l_invoice = Invoice.first.id, Invoice.last.id
  num.times do
    InvoiceItem.create(item_id: a.rand(f_item..l_item),
                       invoice_id: a.rand(f_invoice..l_invoice),
                       quantity: a.rand(1..10),
                       unit_price: a.rand(100..25000))
  end
end

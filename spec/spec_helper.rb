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

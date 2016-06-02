require "rails_helper"

describe Invoice, "validations" do
  it { should belong_to(:merchant) }
  it { should have_many(:transactions) }
  it { should have_many(:invoice_items) }
  it { should have_many(:items).through(:invoice_items) }
  it { should belong_to(:customer) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:merchant_id) }
  it { should validate_presence_of(:status) }
end

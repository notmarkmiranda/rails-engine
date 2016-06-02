require "rails_helper"

describe Merchant, "validations" do
  it { should have_many(:items) }
  it { should have_many(:customers).through(:invoices) }
  it { should have_many(:transactions).through (:invoices) }
  it { should have_many(:invoice_items).through(:invoices) }
  it { should validate_presence_of(:name) }
end

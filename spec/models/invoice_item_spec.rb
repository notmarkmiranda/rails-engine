require "rails_helper"

describe InvoiceItem, "validations" do
  it { should validate_presence_of(:item_id)}
  it { should validate_presence_of(:invoice_id)}
  it { should validate_presence_of(:quantity)}
  it { should validate_presence_of(:unit_price)}
end

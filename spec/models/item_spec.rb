require "rails_helper"

describe Item, "validations" do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:unit_price) }
  it { should validate_presence_of(:merchant_id) }
end

require "rails_helper"

describe Merchant, "validations" do
  it { should have_many(:items) }
  it { should validate_presence_of(:name) }
end

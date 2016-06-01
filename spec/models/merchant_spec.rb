require "rails_helper"

describe Merchant, "validations" do
  it { should validate_presence_of(:name) }
end

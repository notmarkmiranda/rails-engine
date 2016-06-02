require "rails_helper"

describe "customer - favorite merchant API" do
  before do
    create_full_data
  end

  it "returns a customers favorite merchant" do
    get "/api/v1/customers/#{Customer.first.id}/favorite_merchant"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["name"]).to be_present
  end
end

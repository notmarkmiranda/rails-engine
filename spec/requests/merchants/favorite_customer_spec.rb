require "rails_helper"

describe "merchant - favorite customer API" do
  before do
    create_full_data
  end

  it "returns a merchants favorite customer" do
    get "/api/v1/merchants/#{Merchant.first.id}/favorite_customer"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body["first_name"]).to be_present
  end

end

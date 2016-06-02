require "rails_helper"

describe "merchants - most_revenue API" do
  before do
    create_full_data
  end

  it "returns merchants ranked by most revenue" do
    get "/api/v1/merchants/most_revenue?quantity=2"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 2
  end

  it "returns merchants ranked by most revenue" do
    get "/api/v1/merchants/most_revenue?quantity=5"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 5
  end
end

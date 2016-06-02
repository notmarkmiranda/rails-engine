require "rails_helper"

describe "merchants - most items sold API" do
  before do
    create_full_data
  end

  it "returns the top 2 merchants ranked by total number of items sold" do
    get "/api/v1/merchants/most_items?quantity=2"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
  end

  it "returns the top 5 merchants ranked by total number of items sold" do
    get "/api/v1/merchants/most_items?quantity=5"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
  end
end

require "rails_helper"

describe "items - most items sold API" do
  before do
    create_full_data
  end

  it "returns top 2 items ranked by the total number of items sold" do
    get "/api/v1/items/most_items?quantity=2"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 2
  end

  it "returns top 5 items ranked by the total number of items sold" do
    get "/api/v1/items/most_items?quantity=5"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 5
  end
end

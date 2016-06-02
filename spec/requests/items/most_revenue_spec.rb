require "rails_helper"

describe "items - most_revenue API" do
  before do
    create_full_data
  end

  it "return items ranked by most revenue" do
    get "/api/v1/items/most_revenue?quantity=2"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 2
  end

  it "return items ranked by most revenue" do
    get "/api/v1/items/most_revenue?quantity=5"
    body = JSON.parse(response.body)
    expect(response.status).to eq 200
    expect(body.count).to eq 5
  end
end

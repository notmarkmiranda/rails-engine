require "rails_helper"

describe "merchant-items API" do
  describe "GET merchant/id/items" do
    it "returns all the items" do
      create_items_with_x_merchants(5, 1)
      m_items = Merchant.last.items

      get "/api/v1/merchants/#{Merchant.last.id}/items"

      body = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(body.first["name"]).to eq m_items.first.name
    end
  end
end

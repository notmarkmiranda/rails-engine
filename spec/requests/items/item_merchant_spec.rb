require "rails_helper"

describe "item-merchant API" do
  describe "GET items/id/merchant" do
    it "returns the merchant associated with an item" do
      create_items_with_x_merchants
      i_merchant = Item.last.merchant

      get "/api/v1/items/#{Item.last.id}/merchant"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["name"]).to eq i_merchant.name
    end
  end
end

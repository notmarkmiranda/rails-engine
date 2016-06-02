require "rails_helper"

describe "item-invoice_items API" do
  describe "GET items/id/invoice_items" do
    it "returns all invoice items associated with an item" do
      create_invoice_items(20)
      i_invoice_item = Item.last.invoice_items

      get "/api/v1/items/#{Item.last.id}/invoice_items"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["id"]).to eq i_invoice_item.first.id
    end
  end
end

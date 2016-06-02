require "rails_helper"

describe "invoice_items-item API" do
  describe "GET invoice_items/id/item" do
    it "returns the item associated with an invoice item" do
      create_invoice_items
      ii_item = InvoiceItem.last.item

      get "/api/v1/invoice_items/#{InvoiceItem.last.id}/item"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["name"]).to eq ii_item.name
    end
  end
end

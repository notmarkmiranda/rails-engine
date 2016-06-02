require "rails_helper"

describe "invoice-items API" do
  describe "get /invoices/id/items" do
    it "returns all the associated items" do
      create_invoice_items(20)
      i_items = Invoice.last.items

      get "/api/v1/invoices/#{Invoice.last.id}/items"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["description"]).to eq i_items.first.description
    end
  end
end

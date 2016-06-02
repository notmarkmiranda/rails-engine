require "rails_helper"

describe "invoice-invoice_items API" do
  describe "GET invoices/id/invoice_items" do
    it "returns all the associated invoice_items" do
      create_invoice_items(9)
      i_invoice_items = Invoice.last.invoice_items

      get "/api/v1/invoices/#{Invoice.last.id}/invoice_items"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["id"]).to eq i_invoice_items.first.id
    end
  end
end

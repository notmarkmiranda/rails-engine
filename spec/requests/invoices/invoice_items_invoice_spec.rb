require "rails_helper"

describe "invoice_items-invoice API" do
  describe "GET invoice_items/id/invoice" do
    it "returns the invoice associated with an invoice item" do
      create_invoice_items
      ii_invoice = InvoiceItem.last.invoice

      get "/api/v1/invoice_items/#{InvoiceItem.last.id}/invoice"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["customer_id"]).to eq ii_invoice.customer.id
    end
  end
end

require "rails_helper"

describe "invoice-merchant API" do
  describe "GET invoices/id/merchant" do
    it "returns the merchant associated with an invoice" do
      create_invoices(1)
      i_merchant = Invoice.last.merchant

      get "/api/v1/invoices/#{Invoice.last.id}/merchant"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["name"]).to eq i_merchant.name
    end
  end
end

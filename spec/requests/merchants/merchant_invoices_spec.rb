require "rails_helper"

describe "merchant-invoices API" do
  describe "GET merchant/id/invoices" do
    it "returns all the invoices" do
      create_invoices(20)
      m_invoices = Merchant.last.invoices

      get "/api/v1/merchants/#{Merchant.last.id}/invoices"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["status"]).to eq m_invoices.first.status
    end
  end
end

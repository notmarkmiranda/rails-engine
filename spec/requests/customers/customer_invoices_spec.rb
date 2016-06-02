require "rails_helper"

describe "customer-invoices API" do
  describe "GET customers/id/invoices" do
    it "returns invoices associated with a customer" do
      create_invoices(2)
      c_invoices = Customer.last.invoices

      get "/api/v1/customers/#{Customer.last.id}/invoices"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["customer_id"]).to eq c_invoices.first.customer_id
    end
  end
end

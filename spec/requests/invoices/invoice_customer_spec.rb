require "rails_helper"

describe "invoice-customer API" do
  describe "GET invoices/id/customer" do
    it "returns the customer associated with an invoice" do
      create_invoices(1)
      i_customer = Invoice.last.customer

      get "/api/v1/invoices/#{Invoice.last.id}/customer"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["first_name"]).to eq i_customer.first_name
    end
  end
end

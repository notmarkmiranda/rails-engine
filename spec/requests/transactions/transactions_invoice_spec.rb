require "rails_helper"

describe "transaction-invoice API" do
  describe "GET transactions/id/invoice" do
    it "returns to invoice associated with a transaction" do
      create_transactions(1)
      t_invoice = Transaction.last.invoice

      get "/api/v1/transactions/#{Transaction.last.id}/invoice"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body["customer_id"]).to eq t_invoice.customer_id
    end
  end
end

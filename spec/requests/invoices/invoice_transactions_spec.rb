require "rails_helper"

describe "invoice-transactions API" do
  describe "GET invoices/id/transactions" do
    it "returns all the associated transactions" do
      create_transactions(2)
      i_transactions = Invoice.last.transactions

      get "/api/v1/invoices/#{Invoice.last.id}/transactions"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["id"]).to eq i_transactions.first.id
    end
  end
end

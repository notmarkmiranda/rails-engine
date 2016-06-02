require "rails_helper"

describe "customer-transactions API" do
  describe "GET customers/id/transactions" do
    it "returns the transactions associated with a customer" do
      create_transactions(1)
      c_transactions = Customer.last.transactions

      get "/api/v1/customers/#{Customer.last.id}/transactions"

      body = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(body.first["id"]).to eq c_transactions.first.id
    end
  end
end

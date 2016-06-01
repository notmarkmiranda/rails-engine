require "rails_helper"

describe Api::V1::TransactionsController do

  before do
    create_transactions(2)
  end

  it "GET#index" do
    get :index, format: :json
    transactions = JSON.parse(response.body)
    expect(response).to be_success
    expect(transactions.count).to eq 2
  end

  it "GET#show" do
    id = Transaction.first.id
    get :show, id: id, format: :json
    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction["id"]).to eq id
  end

  it "GET#find - one transaction by id" do
    trans = Transaction.last
    id = trans.id
    get :find, transaction: {id: id}, format: :json
    transaction = JSON.parse(response.body)
    expect(response).to be_success
    expect(transaction["id"]).to eq id
  end

  it "GET#find_all" do
    trans = Transaction.last
    get :find_all, transaction: {id: trans.id}, format: :json
    transaction = JSON.parse(response.body)
    expect(transaction.count).to eq 1
    expect(transaction.class).to eq Array
  end
end

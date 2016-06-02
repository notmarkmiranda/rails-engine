require "rails_helper"

describe Api::V1::InvoicesController do
  before do
    create_invoices(2)
  end

  it "GET#index" do
    get :index, format: :json
    invoices = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoices.count).to eq 2
  end

  it "GET#show" do
    id = Invoice.first.id
    get :show, id: id, format: :json
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq id
  end

  it "GET#find - one invoice by id" do
    inv = Invoice.last
    id = inv.id
    get :find, id: id, format: :json
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq id
  end

  it "GET#find_all" do
    inv = Invoice.last
    id = inv.id
    get :find_all, id: id, format: :json
    invoice = JSON.parse(response.body)
    expect(invoice.count).to eq 1
    expect(invoice.class).to eq Array
  end

  it "GET#random" do
    get :random, format: :json
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice.class).to eq Hash
  end
end

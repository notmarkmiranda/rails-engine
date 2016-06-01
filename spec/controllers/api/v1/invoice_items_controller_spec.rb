require "rails_helper"

describe Api::V1::InvoiceItemsController do

  before do
    create_invoice_items(5)
  end

  it "GET#index" do
    get :index, format: :json
    ii = JSON.parse(response.body)
    expect(response).to be_success
    expect(ii.count).to eq 5
  end

  it "GET#show" do
    id = InvoiceItem.first.id
    get :show, id: id, format: :json
    ii = JSON.parse(response.body)
    expect(response).to be_success
    expect(ii["id"]).to eq id
  end

  it "GET#find - one invoice_item by id" do
    ii = InvoiceItem.last
    id = ii.id
    get :find, invoice_item: {id: id}, format: :json
    invoice_item = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice_item["id"]).to eq id
  end

  it "GET#find_all" do
    ii = InvoiceItem.last
    get :find_all, invoice_item: {id: ii.id}, format: :json
    invoice_item = JSON.parse(response.body)
    expect(invoice_item.count).to eq 1
    expect(invoice_item.class).to eq Array
  end
end

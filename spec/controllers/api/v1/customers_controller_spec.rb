require "rails_helper"

describe Api::V1::CustomersController do

  before do
    create_customers(2)
  end

  it "GET#index" do
    get :index, format: :json
    customers = JSON.parse(response.body)
    expect(response).to be_success
    expect(customers.count).to eq 2
  end

  it "GET#show" do
    id = Customer.first.id
    get :show, id: id, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["id"]).to eq id
  end

  it "GET#find - one customer by name" do
    cust = Customer.last
    name = cust.last_name
    get :find, last_name: name, format: :json

    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["last_name"]).to eq name
  end

  it "GET#find - one customer by name, case insensitive" do
    cust = Customer.last
    upcased = cust.first_name.upcase
    get :find, first_name: upcased, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["first_name"]).to eq cust.first_name
  end

  it "GET#find - using multiple parameters" do
    cust = Customer.last
    fn = cust.first_name
    ln = cust.last_name
    get :find, first_name: fn, last_name: ln, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["first_name"]).to eq fn
    expect(customer["last_name"]).to eq ln
  end

  it "GET#find_all" do
    cust = Customer.last
    get :find_all, first_name: cust.first_name, format: :json
    customer = JSON.parse(response.body)
    expect(customer.count).to eq 1
    expect(customer.class).to eq Array
  end

  it "GET#find_all - time" do
    cust = Customer.last
    get :find_all, created_at: cust.created_at, format: :json
    customer = JSON.parse(response.body)
    expect(customer.count).to eq 1
    expect(customer.class).to eq Array
  end

  it "GET#random" do
    get :random, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer.class).to eq Hash
  end


end

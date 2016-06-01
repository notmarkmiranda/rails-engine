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
    get :find, customer: {last_name: name}, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["last_name"]).to eq name
  end

  it "GET#find - one customer by name, case insensitive" do
    cust = Customer.last
    upcased = cust.first_name.upcase
    get :find, customer: {first_name: upcased}, format: :json
    customer = JSON.parse(response.body)
    expect(response).to be_success
    expect(customer["first_name"]).to eq cust.first_name
  end

  it "GET#find_all" do
    cust = Customer.last
    get :find_all, customer: {first_name: cust.first_name}, format: :json
    customer = JSON.parse(response.body)
    expect(customer.count).to eq 1
    expect(customer.class).to eq Array
  end


end

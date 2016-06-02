require "rails_helper"

describe Api::V1::MerchantsController do

  before do
    create_merchants(2)
  end

  it "GET#index" do
    get :index, format: :json
    merchants = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchants.count).to eq 2
  end

  it "GET#show" do
    id = Merchant.first.id
    get :show, id: id, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["id"]).to eq id
  end

  # it "POST#create" do
  #   post :create, name: "MARK'S STORE!", format: :json
  #   merchant = Merchant.last
  #   expect(response).to be_success
  #   expect(merchant.name).to eq "MARK'S STORE!"
  # end
  #
  # it "PUT#update" do
  #   id = Merchant.first.id
  #   old_name = Merchant.first.name
  #   # merch_params = name: "NEW NAME"
  #
  #   put :update, id: id, name: "NEW NAME", format: :json
  #   merchant = Merchant.find_by(id: id)
  #
  #   expect(response).to be_success
  #   expect(merchant.name).to eq merch_params[:name]
  # end
  #
  # it "DELETE#destroy" do
  #   merchant = Merchant.last
  #   expect{ delete :destroy, id: merchant.id, format: :json }.to change{ Merchant.count }.by(-1)
  # end
  #
  # it "GET#find - one merchant by id" do
  #   merch = Merchant.last
  #   get :find, merchant: {id: merch.id}, format: :json
  #   merchant = JSON.parse(response.body)
  #   expect(response).to be_success
  #   expect(merchant["name"]).to eq merch.name
  # end

  it "GET#find - one merchant by name" do
    merch = Merchant.last
    get :find, name: merch.name, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq merch.name
  end

  it "GET#find - one merchant by name" do
    merch = Merchant.last
    upcased = merch.name.upcase
    get :find, name: upcased, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq merch.name
  end

  it "GET#find_all" do
    merch = Merchant.last
    get :find_all, name: merch.name, format: :json
    merchant = JSON.parse(response.body)
    expect(merchant.count).to eq 1
    expect(merchant.class).to eq Array
  end

  it "GET#random" do
    get :random, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant.class).to eq Hash
  end

  # it "GET#items" do
  #   create_items_with_x_merchants(5)
  #   merch = Merchant.first
  #   icount = merch.items.count
  #
  #   get :items, id: merch.id, format: :json
  #   require 'pry'; binding.pry
  #   items = JSON.parse(response.body)
  #   expect(items.size).to eq icount
  # end

  # request specs similar as feature tests
  #

  # it "GET#invoices" do
  #   create_invoices(10)
  #   merch = Merchant.first
  #   invcount = merch.invoices.count
  #
  #   get :invoices, id: merch.id, format: :json
  #   invoices = JSON.parse(response.body)
  #   expect(invoices.size).to eq invcount
  # end
end

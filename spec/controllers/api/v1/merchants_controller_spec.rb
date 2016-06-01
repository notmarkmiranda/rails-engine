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

  it "POST#create" do
    merch_params = { name: Faker::Company.name }
    post :create, merchant: merch_params, format: :json
    merchant = Merchant.last
    expect(response).to be_success
    expect(merchant.name).to eq merch_params[:name]
  end

  it "PUT#update" do
    id = Merchant.first.id
    old_name = Merchant.first.name
    merch_params = { name: "NEW NAME" }

    put :update, id: id, merchant: merch_params, format: :json
    merchant = Merchant.find_by(id: id)

    expect(response).to be_success
    expect(merchant.name).to eq merch_params[:name]
  end

  it "DELETE#destroy" do
    merchant = Merchant.last
    expect{ delete :destroy, id: merchant.id, format: :json }.to change{ Merchant.count }.by(-1)
  end

  it "GET#find - one merchant by id" do
    merch = Merchant.last
    get :find, merchant: {id: merch.id}, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq merch.name
  end

  it "GET#find - one merchant by name" do
    merch = Merchant.last
    get :find, merchant: {name: merch.name}, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq merch.name
  end

  it "GET#find - one merchant by name" do
    merch = Merchant.last
    upcased = merch.name.upcase
    get :find, merchant: {name: upcased}, format: :json
    merchant = JSON.parse(response.body)
    expect(response).to be_success
    expect(merchant["name"]).to eq merch.name
  end

  it "GET#find_all" do
    merch = Merchant.last
    get :find_all, merchant: {name: merch.name}, format: :json
    merchant = JSON.parse(response.body)
    expect(merchant.count).to eq 1
    expect(merchant.class).to eq Array
  end

end

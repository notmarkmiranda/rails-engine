require "rails_helper"

describe Api::V1::ItemsController do

  before do
    create_items_with_five_merchants(25)
  end

  it "GET#index" do
    get :index, format: :json
    items = JSON.parse(response.body)
    expect(response).to be_success
    expect(items.count).to eq 25
  end

  it "GET#show" do
    id = Item.first.id
    get :show, id: id, format: :json
    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item["id"]).to eq id
  end

  it "POST#create" do
    first = Merchant.first.id
    last = Merchant.last.id
    item_params = { name: Faker::Commerce.product_name,
                    description: Faker::Hipster.paragraph,
                    unit_price: Faker::Number.between(100, 25000),
                    merchant_id: Random.new.rand(first..last)}
    post :create, item: item_params , format: :json
    item = Item.last
    expect(response).to be_success
    expect(item.name).to eq item_params[:name]
  end

  it "PUT#update" do
    id = Item.first.id
    old_name = Item.first.name
    item_params = { name: "NEW NAME" }

    put :update, id: id, item: item_params, format: :json
    item = Item.find_by(id: id)

    expect(response).to be_success
    expect(item.name).to eq item_params[:name]
  end

  it "DELETE#destroy" do
    item = Item.last
    expect{ delete :destroy, id: item.id, format: :json }.to change{ Item.count }.by(-1)
    # expect{ User.from_omniauth(@auth_hash) }.to change{ User.all.size }.from(0).to(1)
  end
end

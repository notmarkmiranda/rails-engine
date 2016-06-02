require "rails_helper"

describe Api::V1::ItemsController do

  before do
    create_items_with_x_merchants(25)
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

  it "GET#find" do
    it = Item.last
    get :find, name: it.name, format: :json
    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item["name"]).to eq it.name
  end

  it "GET#find - case insensitive" do
    it = Item.last
    upcased = it.name.upcase
    get :find, name: upcased, format: :json
    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item["name"]).to eq it.name
  end

  it "GET#find_all" do
    it = Item.last
    get :find_all, name: it.name, format: :json
    item = JSON.parse(response.body)
    expect(item.count).to eq 1
    expect(item.class).to eq Array
  end

  it "GET#random" do
    get :random, format: :json
    item = JSON.parse(response.body)
    expect(response).to be_success
    expect(item.class).to eq Hash
  end

end

class ItemSerializer < ActiveModel::Serializer
  attributes :description, :id, :merchant_id, :name, :unit_price

  def unit_price
    "#{object.unit_price.to_f * 0.01}"
  end
end

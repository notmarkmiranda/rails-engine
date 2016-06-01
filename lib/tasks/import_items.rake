require 'csv'

desc "import items"
task import_items: [ :environment ] do
  CSV.foreach("./db/csv/items.csv", { headers: true, header_converters: :symbol }) do |row|
    Item.new do |i|
      i.id = row[:id]
      i.name = row[:name]
      i.description = row[:description]
      i.unit_price = row[:unit_price]
      i.merchant_id = row[:merchant_id]
      i.created_at = row[:created_at]
      i.updated_at = row[:updated_at]
      i.save
    end
  end
  puts "CREATED #{Item.count} ITEMS!"
end

require 'csv'

desc "import merchants"
task import_merchants: [ :environment ] do
  CSV.foreach("./db/csv/merchants.csv", { headers: true, header_converters: :symbol}) do |row|
    Merchant.new do |m|
      m.id = row[:id]
      m.name = row[:name]
      m.created_at = row[:created_at]
      m.updated_at = row[:updated_at]
      m.save
    end
  end
  puts "CREATED #{Merchant.count} MERCHANTS!"
end

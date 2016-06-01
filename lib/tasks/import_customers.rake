require 'csv'

desc "import customers"
task import_customers: [ :environment ] do
  CSV.foreach("./db/csv/customers.csv", { headers: true, header_converters: :symbol}) do |row|
    Customer.new do |c|
      c.id = row[:id]
      c.first_name = row[:first_name]
      c.last_name = row[:last_name]
      c.created_at = row[:created_at]
      c.updated_at = row[:updated_at]
      c.save
    end
  end
  puts "CREATED #{Customer.count} CUSTOMERS!"
end

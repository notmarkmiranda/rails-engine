require "csv"

desc "import invoices"
task import_invoices: [ :environment ] do
  CSV.foreach("./db/csv/invoices.csv", { headers: true, header_converters: :symbol }) do |row|
    Invoice.new do |i|
      i.id = row[:id]
      i.customer_id = row[:customer_id]
      i.merchant_id = row[:merchant_id]
      i.status = row[:status]
      i.created_at = row[:created_at]
      i.updated_at = row[:updated_at]
      i.save
    end
  end
  puts "CREATED #{Invoice.count} INVOICES!"
end

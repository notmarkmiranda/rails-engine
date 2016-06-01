require 'csv'

desc "import invoice items"
task import_invoice_items: [ :environment ] do
  CSV.foreach("./db/csv/invoice_items.csv", { headers: true, header_converters: :symbol}) do |row|
    InvoiceItem.new do |c|
      c.id = row[:id]
      c.item_id = row[:item_id]
      c.invoice_id = row[:invoice_id]
      c.quantity = row[:quantity]
      c.unit_price = row[:unit_price]
      c.created_at = row[:created_at]
      c.updated_at = row[:updated_at]
      c.save
    end
  end
  puts "CREATED #{InvoiceItem.count} INVOICE ITEMS!"
end

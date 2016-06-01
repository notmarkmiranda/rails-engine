require 'csv'

desc "import transactions"
task import_transactions: [ :environment ] do
  CSV.foreach("./db/csv/transactions.csv", { headers: true, header_converters: :symbol}) do |row|
    Transaction.new do |c|
      c.id = row[:id]
      c.invoice_id = row[:invoice_id]
      c.credit_card_number = row[:credit_card_number]
      c.credit_card_exp = row[:credit_card_exp]
      c.result = row[:result]
      c.created_at = row[:created_at]
      c.updated_at = row[:updated_at]
      c.save
    end
  end
  puts "CREATED #{Transaction.count} TRANSACTIONS!"
end

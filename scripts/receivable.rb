require 'csv'

puts "> Enter the namespace of '請求書番号'"
namespace = gets.chomp

puts "> Enter the start number of '請求書番号'"
start_number = gets.chomp.to_i

puts "> Enter '請求書コード'"
code = gets.chomp

puts "> Enter the number of rows"
rows = gets.chomp.to_i

puts "> Create a new file? (y/n)"
create = gets.chomp

if create == "y"
  file_name = "csv/receivable_invoices.csv"

  if File.exist?(file_name)
    puts "> File already exists. Overwrite? (y/n)"
    overwrite = gets.chomp
    if overwrite != "y"
      puts "File not created."
      exit
    end
  end

  if !File.exist?("csv")
    puts "Creating csv directory..."
    Dir.mkdir("csv")
  end

  puts 'Creating csv file...'
  CSV.open(file_name, "w") do |csv|
    header = ['請求書番号','請求先コード','宛名 任意','請求日','支払期日 任意','日付 任意','品目','単価','数量','税率','品目詳細 任意','振込先 任意','備考 任意','案件ID 任意','計算方法 任意']
    csv << header

    prices = [100, 300, 500, 1000]
    amounts = [1, 2, 3, 4]
    rows.times do |i|
      row = Array.new(header.size)
      row[header.index('請求書番号')] = "#{namespace}#{start_number + i}"
      row[header.index('請求先コード')] = code
      row[header.index('請求日')] = Date.today.to_s.gsub(/-/, '/')
      row[header.index('品目')] = "品目#{i + 1}"
      row[header.index('単価')] = prices[i % prices.size]
      row[header.index('数量')] = amounts[i % amounts.size]
      row[header.index('税率')] = "10%"
      csv << row
    end
  end

  puts "File created: #{file_name}"
end

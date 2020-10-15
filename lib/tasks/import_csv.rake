require "import"

namespace :import_csv do
  desc "CSVデータをインポートするタスク"

  task users: :environment do
    path = "lib/import.rb"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "インポート処理を開始"

    begin
      User.create!(list)
      puts "インポート完了！！"
    rescue => e
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end
end

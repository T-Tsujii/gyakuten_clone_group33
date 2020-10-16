require "import"

namespace :import_csv do
  desc "CSVデータをインポートするタスク"
  task aws_text: :environment do
    list=Import.csv_data(path: "db/csv_data/aws_text_data.csv")
    puts "インポート処理を開始"
    begin
      AwsText.create!(list)
      puts "インポート完了!!"
    rescue => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "インポートに失敗"
    end
  end
end
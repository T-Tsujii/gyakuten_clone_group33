require "import"

namespace :import_csv do
  desc "AWS教材のCSVデータをインポートするタスク"
  task aws_text: :environment do
    AwsText.destroy_all
    list=Import.csv_data(path: "db/csv_data/aws_text_data.csv")
    AwsText.create!(list)
    puts "AWS教材のインポートが完了しました"
  end
  desc "Rails動画教材のCSVデータをインポートするタスク"
  task movie: :environment do
    Movie.destroy_all
    list=Import.csv_data(path: "db/csv_data/movie_data.csv")
    Movie.create!(list)
    puts "Rails動画教材のインポートが完了しました"
  end
  desc "質問集のCSVデータをインポートするタスク"
  # タスク名 => users
  task questions: :environment do
    # インポートするファイルのパスを取得
    path = "db/csv_data/question_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h.merge({user_id: User.ids.sample})
    end
    puts "質問集のインポート処理を開始"
    # インポートができなかった場合の例外処理
    begin
      Question.create!(list)
      puts "質問集のインポートが完了しました!!"
    rescue => e
      # 例外が発生した場合の処理
      # インポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}"
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "質問集のインポートに失敗"
    end
  end
 
end
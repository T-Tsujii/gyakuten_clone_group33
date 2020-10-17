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
 
end
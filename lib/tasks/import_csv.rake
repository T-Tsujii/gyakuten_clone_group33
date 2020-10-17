require "import"

namespace :import_csv do
  desc "CSVデータをインポートするタスク"
  task aws_text: :environment do
    AwsText.destroy_all
    list=Import.csv_data(path: "db/csv_data/aws_text_data.csv")
    AwsText.create!(list)
    puts "AWS教材のインポートが完了しました"
  end
end
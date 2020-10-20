# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
EMAIL = 'test@example.com'
PASSWORD = 'password'

# テストユーザが存在しない時だけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end



AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

EMAIL = 'admin@example.com'
PASSWORD = 'password'
AdminUser.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
end
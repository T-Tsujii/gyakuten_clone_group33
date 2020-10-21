ADMIN＿EMAIL = 'admin@example.com'
ADMIN＿PASSWORD = 'password'
EMAIL = 'test@example.com'
PASSWORD = 'password'


# テストユーザが存在しない時だけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end


AdminUser.find_or_create_by!(email: ADMIN＿EMAIL) do |user|
  user.password = ADMIN＿PASSWORD
end
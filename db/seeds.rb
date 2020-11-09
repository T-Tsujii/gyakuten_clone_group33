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

User.destroy_all
Question.destroy_all

user1 = User.create!(email:"satou@example.com", password: "password")
user2 = User.create!(email:"suzuki@example.com", password: "password")
user3 = User.create!(email:"tanaka@example.com", password: "password")

question1 = user2.questions.create!(title: "質問1", detail:"テスト1")
question2 = user3.questions.create!(title: "質問2", detail:"テスト2")
question3 = user3.questions.create!(title: "質問3", detail:"テスト3")
question4 = user1.questions.create!(title: "質問4", detail:"テスト4")

question1.answers.create(user_id: user1.id, content: "回答１")
question1.answers.create(user_id: user3.id, content: "回答２")
question3.answers.create(user_id: user2.id, content: "回答３")
question4.answers.create(user_id: user1.id, content: "回答４")
question2.answers.create(user_id: user3.id, content: "回答５")
question4.answers.create(user_id: user1.id, content: "回答６")
question3.answers.create(user_id: user2.id, content: "回答７")

User.create!(email: EMAIL, password: PASSWORD)

puts "初期質問データの投入に成功しました"
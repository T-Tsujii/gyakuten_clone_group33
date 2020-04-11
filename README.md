## 逆転教材クローンアプリ

### 開発環境

- Ruby 2.6.6
- Rails 6.0.3.3
- PostgreSQL

### 開発環境構築

```
git clone URL名
cd リポジトリ名
bundle config set path vendor/bundle --local
bundle install
yarn install --check-files
rails db:create db:migrate
```

### 初期データ投入方法

- 開発環境のログイン用アカウントの投入
  - 通常ログイン（タスク6で作成）
  - 管理者ログイン（タスク14で作成）

```
rails db:seed
```

- 各種データの投入に必要なコマンドの確認
  - AWS教材（タスク9で作成）
  - Rails動画教材（タスク15で作成）
  - その他（タスク20以降）

```
rails routes | grep import
```

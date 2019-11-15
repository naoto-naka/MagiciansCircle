# アプリケーション名
  MagiciansCircle
# 概要
  マジックを行う人(未経験者〜上級者)向けに作成した、情報共有サイトです。
# 実装機能
  **動画関連**                 
  - 動画投稿機能                
    - プライベート設定機能         

  - 動画詳細機能                
    - 部分リピート機能             
    - 再生速度変更機能
    - 動画評価機能
    - タグ登録機能
    - 再生回数機能
    - お気に入り機能

  - 動画一覧機能
    - キーワード検索機能
    - ページネーション機能
  
  **イベント関連**
  - イベント投稿機能
    - GoogleMap表示(googleAPI)
  - イベント一覧
    - イベントカレンダー(fullcalendar)
  
  **その他機能**
  - ユーザ認証機能
  - ページネーション機能
    
# 特徴
  動画の部分リピート機能により、見たいシーンを何度も繰り返し確認することができます。
# バージョン
  ruby version (2.5.5p157)  
  rails version (5.2.3)
# 使用ライブラリ
  gem 'devise'
  gem 'carrierwave'
  gem 'streamio-ffmpeg'
  gem 'kaminari-bootstrap'
  gem 'rails-i18n'
  gem 'jquery-rails'
  gem 'fullcalendar-rails'
  gem 'momentjs-rails'
  gem 'rmagick'
  gem 'acts-as-taggable-on'
  gem 'ransack'
  gem 'activeadmin'
  gem 'jquery-ui-rails'
  gem 'http'
  gem 'just-datetime-picker'
  gem 'active_admin_flat_skin'
  gem 'json'
  gem 'mysql2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'dotenv-rails'
# 使用方法
```bash
  git clone https://github.com/naoto-naka/MagiciansCircle.git
  cd MagiciansCircle
  bundle install
  rails db:migrate
  rails s
```
# メモ
  お問い合わせ機能は実装途中のため機能が使用できません。
# 製作者
  * 作成者 中嶋直人
  * E-mail luckywhitecat770@gmail.com

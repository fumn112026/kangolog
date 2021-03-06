## 概要
KANGOLOGは看護師のための記事投稿＆検索アプリです。
自分の持っている知識を記事として記録・共有したり、
知りたいことに関する記事を検索することができます。

## URL
kangolog.work

## 機能一覧 
- 記事一覧表示機能
- 記事詳細表示機能
- 記事投稿機能
- 記事編集機能
- 記事削除機能
- 画像投稿機能
- タグ付け機能

- 管理ユーザー登録機能
- 管理ユーザーログイン機能
- アイコン登録機能
- ユーザー情報編集機能
- 簡単ログイン機能

- 記事検索機能
- コメント機能
- ページネーション

- 単体テスト機能

## 技術一覧
- Ruby 2.6.6
- Ruby on Rails 6.0.3.4
- haml
- scss
- JavaScriptによる非同期通信
- RSpec
- Gem
  - devise
  - Carrierwave
  - jquery-rails
  - kaminari

- MySQL 5.6.50
- Nginx 1.18.0
- Unicorn 5.4.1
- Capistrano
- AWS
  - VPC
  - Route53
  - EC2
  - RDS
  - S3
  - ELB
  - CloudFront
  - CloudWatch

## アプリへの想い
看護師は専門職として生涯学習を求められますが、その学習方法は参考書を読んだり、研修に参加したりとインプットがほとんどです。
インプットとアウトプットを適度なバランスで行うことが、学習効率を最大化する方法だと思います。
しかし、勉強会やセミナーの開催は手軽に行えるものではありません。アウトプットを手軽にする場を作るため、このアプリの開発に至りました。

また、アウトプットの場として、だけではなく、エンジニア業界でのQiitaのように「わからないことがあれば、とりあえずKANGOLOGで検索する」
といった、看護業界での情報検索のプラットフォームになればと考えています。
そのためには記事を投稿してくれる十分なユーザー数の確保、医療に関する情報のため信憑性を担保する機能、よりユーザビリティの高い検索機能など
課題も多く残されており、継続して開発を行っています。

## DB設計
 ![ER_diagram](https://user-images.githubusercontent.com/60561936/108163075-bb05fc80-7131-11eb-9368-2a6e210cd174.png)

## インフラ構成図
![infra_diagram](https://user-images.githubusercontent.com/60561936/108191290-4c876580-7156-11eb-9990-5a1224e60c85.png)

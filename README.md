# README

## このリポジトリについて

ボイスチャットアプリのアプリケーションサーバーのリポジトリです。
voicechat アプリについては、wiki を参照してください。

## インストール

### host ファイルの編集

以下を host ファイルに追加

```
myapp.test.com   127.0.0.1
```

### env ファイルの追加

.env というファイルをトップディレクトリに作って、以下の二つの値をいれる
（hogehoge, piyopiyo には、google oauth のキーを入れる）
google_oauth_secret="hogehoge"
google_oauth_key="piyopiyo"

### docker ビルド

```
git submodule update --init --recursive
docker-compose build
docker-compose run web bin/setup
docker-compose run web bin/rails db:seed
docker-compose up
```

## 開発環境

### サーバー

http://myapp.test.com

### swagger

http://localhost:8080

## 開発の流れ

1. API スキーマを編集
2. API スキーマを取り込んで、それをもとにテストを書く
3. テストが通るように serializer、controller などを設定していく

### api のスキーマ定義について

別リポジトリでスキーマを管理していて、サブモジュールとしてもってきています。

https://stoplight.io/

スキーマはなるべく、手でいじらず、上記サイトから GUI 経由で編集してください。

### テストについて

committee を使っています。
@TODO 詳細を書く

### serializer などの実装について

ActiveRecordSerializer を使っています。

## staging 環境について

heroku を利用しています。

```
heroku login
git push heroku master
```

で push 可能です

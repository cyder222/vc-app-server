# README

## このリポジトリについて
ボイスチャットアプリのアプリケーションサーバーのリポジトリです。
voicechatアプリについては、wikiを参照してください。

## インストール
### hostファイルの編集
以下をhostファイルに追加
```
myapp.test.com   127.0.0.1
```

### dockerビルド
```
docker-compose build
docker-compose up
```

## 開発環境
### サーバー
http://myapp.test.com
### swagger
http://localhost:8080

## 開発の流れ
1. APIスキーマを編集
2. APIスキーマを取り込んで、それをもとにテストを書く
3. テストが通るようにserializer、controllerなどを設定していく

### apiのスキーマ定義について
別リポジトリでスキーマを管理していて、サブモジュールとしてもってきています。

https://stoplight.io/

スキーマはなるべく、手でいじらず、上記サイトからGUI経由で編集してください。

### テストについて
committeeを使っています。
@TODO 詳細を書く

### serializerなどの実装について
ActiveRecordSerializerを使っています。

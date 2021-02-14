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


## apiのスキーマ定義について
別リポジトリでスキーマを管理していて、サブモジュールとしてもってきています。

https://stoplight.io/

スキーマはなるべく、手でいじらず、上記サイトからGUI経由で編集してください。

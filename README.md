# 概要
FastAPI+Poetry環境をdockerコマンド一つで作成できます！

Zennにもまとめたぜ！
https://zenn.dev/yamiii/articles/c7c7fa66aedf3f

# 作成方法

```
docker compose up -d
```

### API
http://localhost:8080/
http://localhost:8080/items/5?q=somequery

### docs
http://localhost:8080/docs#/


# 終了方法
```
docker compose down
```


# 解説

ディレクトリ構成は下記のようにシンプルである。
Simple is the Bestとはまさにこのことを言うのではなかろうか。

```
.
├── Dockerfile
├── Taskfile.yml #よく使うコマンドはここに登録しておくと便利
├── app
│   └── main.py
├── compose.yml
├── poetry.lock
└── pyproject.toml

```

## Taskfile.ymlの説明

手軽に導入できるタスクランナー
https://taskfile.dev/installation/

ローカル環境でtaskコマンドが動けば、Taskfile.ymlのコマンドを実行できる。

## poetryコマンド使いたい場合

コンテナ内に入ってコマンド実行する
例えばライブラリを追加したい！

```terminal
docker compose exec api /bin/bash
```

```root@19c309553d08:/app# 
poetry add requests
```

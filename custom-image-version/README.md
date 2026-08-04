# devcon-zenn-cli カスタム Docker イメージバージョン

ここでは Docker Hub にある `hiro345g/devcon-node-dod-git:1.18` イメージをベースとして devcon-zenn-cli カスタム Docker イメージを作成して利用する場合の説明をしています。

## 準備

使い始める前に、開発コンテナー用イメージのビルドが必要です。`devcon-zenn-cli-build/README.md` の説明に従ってビルドしてください。

## 使い方

VS Code で「表示」-「コマンドパレット」でコマンドパレットを開き、「Dev Containers: Open Folder in Container」と入力します。全部入力しなくても、「開発コンテナー:開発コンテナーでフォルダを開く」が指定できるようになったら、それを実行して、GitHub からクローンした devcon-zenn-cli ディレクトリを開きます。

zenn-cli で使用する Zenn 用のコンテンツを保存するリポジトリは Docker ボリューム内に用意することを想定していますが、Docker ホストにあるものを参照することもできます。その場合は、devcon-zenn-cli リポジトリの `share` ディレクトリを使います。

このディレクトリに Zenn 用のコンテンツを保存するリポジトリを置きます。すると、コンテナー内の `/share` に、そのリポジトリが含まれるようになり、コンテナー内から利用できるようになります。

docker-compose.yml が参照する環境変数要ファイル `.env` を用意することで、Docker ホストと devcon-zenn-cli コンテナーが共有するフォルダを変更することができます。`sample.env` を参考にしてください。

## ファイルの構成

```text
./
├── .devcontainer/ ... zenn-cli 開発コンテナー用設定ファイル
│   └── devcontainer.json
├── admin/ ... devcon-zenn-cli:1.18 を通常コンテナーとして起動して root で操作するためのもの
│   ├── docker-compose.yml
│   └── run.sh
├── .gitignore
├── LICENSE ... ライセンス
├── README.md ... このファイル
├── devcon-zenn-cli-build/ ... devcon-zenn-cli:1.18 イメージのビルドに必要なもの
│   ├── .devcontainer/
│   │   └── devcontainer.json
│   ├── README.md ... devcon-zenn-cli:1.18 イメージのビルド方法についての説明
│   ├── build/
│   │   ├── .devcontainer/ ... devcon-zenn-cli:1.18 イメージ用設定ファイル
│   │   │   ├── Dockerfile
│   │   │   └── devcontainer.json
│   │   └── build.sh ... devcon-zenn-cli:1.18 イメージビルド用スクリプト
│   └── docker-compose.yml ... ./build/build.sh 実行用コンテナーのための Docker Compose ファイル
├── docker-compose.yml ... zenn-cli 開発コンテナー用 Docker Compose ファイル
├── sample.env ... 環境変数ファイルのサンプル
└── share/ ... Docker ホストと Docker コンテナ間でファイルを共有したいときに使うディレクトリ
    └── .gitkeep
```

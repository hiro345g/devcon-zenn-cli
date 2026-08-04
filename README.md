# devcon-zenn-cli

これは zenn-cli が使える Dev Container を提供するリポジトリです。mcr.microsoft.com/devcontainers/typescript-node:22-trixie イメージを使用します。

## 準備

使い始める前に、コンテナーが使用する Docker イメージの取得と、Docker ボリュームの初期化が必要です。それらを実行するためのスクリプトを用意してあるので実行します。

```bash
sh script/init.sh
```

または、リポジトリをクローンしたディレクトリをカレントディレクトリーとして下記のコマンドを実行します。

```console
docker pull mcr.microsoft.com/devcontainers/typescript-node:22-trixie
docker compose -f dc/compose.yaml run --rm -u "0:0" dc-zenn-cli chown -R node:node /home/node/workspace
docker compose -f dc/compose.yaml run --rm -u "0:0" dc-zenn-cli sh /script/download_starship.sh
docker compose -p dc-zenn-cli down
```

## 使い方

VS Code で「表示」-「コマンドパレット」でコマンドパレットを開き、「Dev Containers: Open Folder in Container」と入力します。全部入力しなくても、「開発コンテナー:開発コンテナーでフォルダを開く」が指定できるようになったら、それを実行して、GitHub からクローンした devcon-zenn-cli ディレクトリを開きます。

zenn-cli で使用する Zenn 用のコンテンツを保存するリポジトリは Docker ボリューム内に用意することを想定していますが、Docker ホストにあるものを参照することもできます。その場合は、devcon-zenn-cli リポジトリの `share` にコンテナ内に Zenn 用のコンテンツを保存するリポジトリを置きます。すると、コンテナ内の `/home/node/workspace/share` に、そのリポジトリが含まれるようになります。

compose.yaml が参照する環境変数要ファイル `.env` を用意することで、Docker ホストと devcon-zenn-cli コンテナーが共有するフォルダを変更することができます。`sample.env` を参考にしてください。

## ファイルの構成

```text
./
├── .devcontainer/ ... zenn-cli 用 Dev Container
│   └── devcontainer.json
├── custom-image-version/ ...カスタム Docker イメージを作って利用する場合の説明
├── LICENSE
├── README.md
├── dc/ ... zenn-cli 実行環境用コンテナ 兼 Docker ボリューム作成用コンテナ
│   ├── compose.yaml
│   └── script/
│       ├── download_starship.sh
│       ├── init_dot_npm-global.sh
│       ├── install_starship.sh
│       └── install_zenn-cli.sh
├── script/
│   ├── init.sh ... Docker ボリューム初期化用スクリプト
│   └── run.sh ... zenn-cli 実行環境用コンテナ実行用スクリプト
└── share/ ... Docker ホストと Docker コンテナ間でファイルを共有したいときに使うディレクトリ
    └── .gitkeep
```

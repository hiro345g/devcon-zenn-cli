# devcon_build

　`devcon-zenn-cli:1.18` イメージをビルドするためのディレクトリ。

## `devcon-zenn-cli:1.18` イメージのビルド方法

　`${HOME}/workspace/github.com/hiro345g/devcon-zenn-cli` がリポジトリをクローンしたディレクトリだとして、`${REPO_DIR}` と表すとします。VS Code で `${REPO_DIR}/custom-image-version/devcon-zenn-cli-build` を開きます。

```console
REPO_DIR=${HOME}/workspace/github.com/hiro345g/devcon-zenn-cli
code ${REPO_DIR}/custom-image-version/devcon-zenn-cli-build
```

　「コンテナーで再度開く」という通知が表示されるので、クリックします。すると、開発コンテナーが起動して VS Code をアタッチした状態になります。この開発コンテナー起動時に `devcon-zenn-cli:1.18` イメージがビルドされます。

　エラーなどが表示されなかったら成功しています。ターミナルで下記を実行して `devcon-zenn-cli:1.18` イメージが用意されていることを確認してください。

```sh
docker image ls | grep "devcon-zenn-cli" | awk '{printf("%s:%s\n", $1, $2)}'
```

実行例は下記になります。

```console
node ➜ /build $ docker image ls | grep "devcon-zenn-cli" | awk '{printf("%s:%s\n", $1, $2)}'
devcon-zenn-cli:1.18
```

　イメージの作成を確認したら、VS Code をアタッチした開発コンテナーは終了してよいです。VS Code の画面を閉じます。また、ビルド用の開発コンテナーは破棄します。これは `${REPO_DIR}/custom-image-version/devcon-zenn-cli-build/docker-compose.yml` を使って起動しているので、これを破棄します。

　VS Code の画面で `${REPO_DIR}/custom-image-version/devcon-zenn-cli-build/docker-compose.yml` を `Compose Down` します。

　`docker compose down` で破棄する場合は、Docker Compose のプロジェクト名が docker-compose.yml ファイルが置いてあるディレクトリ名となっているので、次のようにコマンドを実行します。

```console
docker compose -p devcon-zenn-cli-build down
```

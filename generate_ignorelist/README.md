# nurikabe-tools/generate_ignorelist

nurikabe を通さずにアクセスしたいサイトのFQDNリストを生成します

## 使い方
### 生成済みの ignorelist を入手する
1. https://github.com/timedia/nurikabe-tools/actions?query=branch%3Amaster+workflow%3A%22Generate+ignorelist+for+nurikabe%22 にアクセスし、最新の実行結果を開きます
2. OS に合った ignorelist をダウンロードします
3. socks proxy の設定を開き、ダウンロードした ignorelist の中身を貼り付けます

### ダウンロードして、自分用の ignorelist を生成する
1. このリポジトリを clone します
    ```sh
    git clone git@github.com:timedia/nurikabe-tools
    ```
2. `generate_ignorelist` ディレクトリに移動し、`bin/generate_nurikabe_ignorelist` を実行します
    ```sh
    cd path/to/nurikabe-tools/generate_ignorelist
    bin/generate_nurikabe_ignorelist --help
    Usage: generate_nurikabe_ignorelist [options]
        -f, --file=FILE     ignorelist の定義ファイルの path を指定します。指定しなかった場合、config/default.yaml を定義ファイルとして利用します。
        -s, --separator=SEP ignorelist の区切り文字を指定します。Windowsで使うためには ";" を、macOS で使うためには "," を指定してください。
    ```

## Requirements
* Ruby 2.6.0 or later

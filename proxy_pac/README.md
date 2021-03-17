# nurikabe-tools/proxy_pac

PC から Proxy 構成ファイルを配布することで、モバイル端末から nurikabe を利用できるようにします

NOTE: Public な server 上で動かすのはやめてください

## 使い方
### PC 側
1. リポジトリをクローンします
    ```sh
    git clone git@github.com:timedia/nurikabe-tools.git
    ```
2. Bundler を使い、依存ライブラリを取得します
    ```sh
    gem install bundler # If has not installed.

    cd path/to/nurikabe-tools/proxy_pac/
    bundle install
    ```
3. `.env.example` ファイルを参考に、`.env` ファイルを作成します
    ```sh
    cp .env{.example,}
    vim .env
    ```
4. HTTP Server/SOCKS Proxy を起動します
    ```sh
    bundle exec foreman start     # HTTP Server/SOCKS Proxy を両方起動する
    bundle exec foreman start web # HTTP Server のみを起動する
    ```

### Mobile 側
#### iPhone
* 設定 -> Wi-Fi -> SSID 右の (i) -> プロキシを構成 -> 自動
  * URL に `http://${WEB_HOST}:${WEB_PORT}/proxy.pac` を設定する

#### Android
##### Xperia SO-01J
* 設定 -> ネットワークとインターネット -> Wi-Fi -> 使用しているWi-Fiを長押し -> ネットワークの変更 -> プロキシ -> プロキシの自動設定
  * PAC URL に `http://${WEB_HOST}:${WEB_PORT}/proxy.pac` を設定する

##### Pixel2
* 設定 -> ネットワークとインターネット -> Wi-Fi -> 使用しているWi-Fiの右側の歯車アイコン -> 右上のペンアイコン -> プロキシ -> プロキシの自動設定
  * PAC URL に `http://${WEB_HOST}:${WEB_PORT}/proxy.pac` を設定する

## Requirements
### PC (macOS/Linux)
  * Ruby 2.6.0 or later
  * OpenSSH

動作確認は macOS のみ。Windows だと IPアドレスの自動取得周りが上手く動かないと思います。

### Mobile
特になし

## 参考
* https://developer.mozilla.org/ja/docs/Web/HTTP/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_(PAC)_file
* https://www.atmarkit.co.jp/ait/articles/1211/21/news111_2.html

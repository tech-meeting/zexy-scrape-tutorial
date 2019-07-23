zexy-scrape-tutorial
====

Install Ruby
----

このチュートリアルを実行するには、スクリプト言語 Ruby が必要です。
Ruby をインストールする方法については、公式サイトを参照してください: https://www.ruby-lang.org/ja/documentation/installation/

Mac の場合は標準の Ruby コマンドの他、 `rbenv` による管理がおすすめです。
Windows の場合は Ruby Installer を使うのがもっとも手軽ですが、本格的な開発環境として使うには Windows Subsystem for Linux による環境構築をするのがいいでしょう。

Install Nokogiri and Other Libraries
----

このチュートリアルでは STEP 2 以降で [Nokogiri](https://nokogiri.org/) という HTML/XML パーサーを使います。
また、Nokogiri のインストールのために Bundler というライブラリ管理ツールを使います。
Bundler をインストールするため、事前に下記のコマンドを実行してください (Ruby がインストールされている環境が必要) 。

```
gem install bundler
```

Tutorial Steps
----

### STEP 1

まずは式場のクチコミページの HTML を生のまま取得し、表示します。

https://github.com/tech-meeting/zexy-scrape-tutorial/tree/master

### STEP 2

STEP 1 では大量の HTML が表示されるため、その中からクチコミ本文を探すのが大変でした。
そのため、クチコミの本文を取り出し、それだけを表示するようにします。

https://github.com/tech-meeting/zexy-scrape-tutorial/tree/step-2

### STEP 3

クチコミ本文以外の点数や招待人数、満足度なども含めた情報を画面に表示するようにします。

https://github.com/tech-meeting/zexy-scrape-tutorial/tree/step-3

### STEP 4

STEP 3 までで取得した情報を CSV ファイルに出力します。

https://github.com/tech-meeting/zexy-scrape-tutorial/tree/step-4

### STEP 5

STEP 4 の機能をそのままに、クライアントコードや出力先のファイル名を後から指定できるようにします。

https://github.com/tech-meeting/zexy-scrape-tutorial/tree/step-5


参考リンク
----

- Rubyのインストール : https://www.ruby-lang.org/ja/documentation/installation/
- Nokogiri : https://nokogiri.org/

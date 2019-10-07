# asakawa_house

### hosting先URL（firebaseサーバー)
https://asakawa-slides.web.app/

## 構築手順

これはflutter_webとFirebase Hostingを使ったwebアプリケーションです。

以下、2つの手順が必要です。
- flutter webでsampleを動かせる状態にする
- firebase hostingでビルドしたsampleをデプロイする

### flutter webでsampleを動かす

- まずflutter doctorコマンドが実行できるようにする（android,xcodeなどはひとまず不要なので、PATHを通す）
- flutterSDKのインストールはここから：[Install - Flutter](https://flutter.dev/docs/get-started/install)
- 環境構築はこの記事を参考にするといい：[Flutter開発環境構築(Mac編) - Qiita](https://qiita.com/akatsukaha/items/3b8a5a6d94a3cdb1e047)
- PATHについては下記を参考に
- bashの場合（fish使ってるので足りてない可能性有り）
```
# flutterの実行コマンドが使えるようになるはず
export PATH="$PATH:/Users/hiroshi.asakawa/Documents/flutter/bin"

# 内部でdartを使ってるのでDARTもPATHを通す
export PATH="$PATH":"$HOME/Documents/flutter/.pub-cache/bin"
```
- fishの場合
```
# flutter
set -x PATH /Users/hiroshi.asakawa/Documents/flutter/bin $PATH

# pub-cache
set -x PATH $HOME/Documents/flutter/.pub-cache/bin $PATH

# Dart
set -x PATH /Users/hiroshi.asakawa/Documents/flutter/bin/cache/dart-sdk $PATH
```
- flutterコマンドが実行できるようになったら
- Flutter for Webのsampleをgithubから取得する
```
$ git clone https://github.com/flutter/flutter_web.git
```
- hello_worldへ移動
```
cd flutter_web/examples/hello_world/
```
- flutterのパッケージを更新
```
$ flutter packages upgrade
```
- Flutter for Web 用のパッケージをインストール
```
$ flutter packages pub global activate webdev
```
- 依存関係にあるライブラリを取得
```
$ pub get
```

グローバル用コマンドとローカル用コマンドでやってることがどう違うのかまだよく理解してない。ここまででコマンドが通らない場合はエラーメッセージ確認、大体はPATHが通ってないことが原因だったりするので、flutterSDKやdartのインスコ先を確認。

- ローカルでサーバーを立ち上げる
```
$ webdev serve
```
- http://localhost:8080をブラウザで開く
- Hello worldと表示されていれば完了
- 他のsampleディレクトリも同様のやり方で動かせる
- ターミナルからは$ webdev serveコマンドでサーバーがたつが、IDEからrunすると127.0.0.1:xxxxxでも立ち上がる。どういう原理か知らないが毎回ポート番号が変わる。

####  謎のハマりポイント
- white screen現象（サーバーは起動しているけれど真っ白な画面しか表示されなくなる）
- 同じようなエラー報告は多い：[[web] White screen and error in console when running Flutter for Web app · Issue #40876 · flutter/flutter · GitHub](https://github.com/flutter/flutter/issues/40876)
- これといった解決法が見当たらなかったけど、.dart_toolsというディレクトリを一度削除したあと再度$webdev serveを実行すると治った。
（buildの際のコンパイルが上手くいってないのでそれ関連のファイルを一旦リセットしたため治った？）
```
.dart_toolがあることを確認
$ ls -a

ディレクトリごと削除
$ rm -r .dart_tool
```

#### sampleが動かせるようになったら次はwebappを新規作成してみる
- IDEからCreate New Projectを選択後、flutter webを選択（このやり方はIntelijayしか使えないみたい）
- AndroidstudioからNew flutter projectしようとしてもflutter webが見当たらないので、仕方なくios/android用としてまずは空のappを作成
- flutter webへの移行ガイドを見ながら必要なファイルやディレクトリを追加していく
[flutter_web/migration_guide.md at master · flutter/flutter_web · GitHub](https://github.com/flutter/flutter_web/blob/master/docs/migration_guide.md)
（flutter web用のcreateコマンドを叩くやり方のほうがスマートかもしれない..）

```
# pubspec.yaml
web用にいくつかのパッケージをごっそり書き換える

# lib/
メインの実行ファイル（main.dartやそれに連なるdartファイル）を配置していく。
インポートするパッケをweb用に更新する必要あり。

# web/
web用にmustで必要なディレクトリなので新規作成

# web/index.html
# web/main.dart
言われるがままに作成。index.htmlはbuildするとbuild/index.htmlも作成される。

# web/assets
これも作成。画像ファイルなどはここに配置していく。

# web/assets/FontManifest.json
カスタムフォントが使いたいならここのjsonに定義。

# web/assets/AssetManifest.json
画像もjsonでここに書いておけば使える。
アプリではpubspec.ymlにasset_pathを記述してたけど、webのほうが楽チンな印象
```
- ここで新規作成したwebappがローカルで実行できればおk
- 既存のhello_worldをコピペして新規作成して改変すると楽チンかも

### 作成したwebappをfirebaseへデプロイしてhosting
- 基本的にこの手順通りに進めていけばよい：[Firebase Hosting  \|  Firebase](https://firebase.google.com/docs/hosting?hl=ja)
- このquita記事がやってることと同じことをやってく（実行コマンドは上記公式参照）：[flutter webのアプリをfirebase hostingで公開する - Qiita](https://qiita.com/hiko1129/items/b55835968820d6e37d27)
- Firebase CLI をインストールする：[Firebase CLI リファレンス  \|  Firebase](https://firebase.google.com/docs/cli/?hl=ja)

- Node.js v8.0.0 以降が必要なので無い人はインスコ
```
# グローバルに使用できるfirebaseコマンドがインストールされる
$ npm install -g firebase-tools
```

```
# GoogleアカウントでFirebaseにログインする
$ firebase login
```

```
# 作成しているfirebaseプロジェクトの一覧が表示されるのでお試しに
$ firebase list
```

```
# プロジェクトの初期化、firebase.jsonと.firebasercが作成される
# このコマンドを実行すると、対話式で色々聞かれるので入力していく
$ firebase init

# 何をしたいのか聞かれる
? Which Firebase CLI features do you want to set up for this folder? Press Space to select features, then Enter to con
firm your choices.

# Hostingを選択
Hosting: Configure and deploy Firebase Hosting sites

# どのディレクトリを使うか聞かれるのでbuildを選択（$webdev buildするとコンパイルされたものがbuildディレクトリに生成されるのでそれを使う）
? What do you want to use as your public directory? build

# シングルページアプリケーションなのかを聞かれるのでyesを選択（なんか最新って感じ）
? Configure as a single-page app (rewrite all urls to /index.html)? Yes

# build以下のindex.htmlを上書きするか聞かれるけど、事前にbuildしてたものを上書きしたくないのでNo選択
? File build/index.html already exists. Overwrite? No

✔  Firebase initialization complete!

# 完了したらデプロイしてみる
$ firebase deploy


# 下の方のURLにアクセスできたらhosting成功！！
（上の方は違うURLなので注意、最初間違えてhostingできてないのかと勘違いしていた）
```
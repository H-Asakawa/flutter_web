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
- web特化の環境構築ならばこちらの記事のほうがみやすい：ソースコードひとつでWeb+Android+iOSに対応！話題のFlutter for Webに爆速入門する方法【5分でHello,World!】https://qiita.com/Ikko_Kojima/items/16b6ca3008b835c452a3
- PATHについては下記を参考に
- fishの場合
```
# flutter
set -x PATH /Users/hiroshiasakawa/Documents/flutter/bin $PATH

# Dart
set -x PATH /Users/hiroshiasakawa/Documents/flutter/bin/cache/dart-sdk/bin $PATH

# webdev
set -x PATH /Users/hiroshiasakawa/Documents/flutter/.pub-cache/bin $PATH
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
- これといった解決法が見当たらなかったけど、.dart_toolというディレクトリを一度削除したあと再度$webdev serveを実行すると治った。
（buildの際のコンパイルが上手くいってないのでそれ関連のファイルを一旦リセットしたため治った？）
```
.dart_toolがあることを確認
$ ls -a

ディレクトリごと削除
$ rm -r .dart_tool
```

#### ハマりポイント2
- $ webdev serveコマンドの実行には、Dartのpathを通す必要がある
- flutterSDKをDLした時点で、/flutter/bin/cache/dart-sdk/binにdartSDKも存在するのでそこにpath通せばおk
- （pathの指定を単純に間違えてた時、dartSDKはわざわざ別でDLしないといけないのか？と悪戦苦闘してしまった）

#### sampleが動かせるようになったら次はwebappを新規作成してみる
- IDEからCreate New Projectを選択後、flutter webを選択（このやり方はInteliJしか使えないみたい）
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
アプリではpubspec.yamlにasset_pathを記述してたけど、webのほうが楽チンな印象
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

# ここでプロジェクトが何もない場合は、firebaseの管理画面からプロジェクトを作成しておく必要がある。これはfirebase公式のガイドに従ったほうがいい。
```

```
# デプロイしたいwebappを事前にビルドしておく
$ webdev build
これを実行するとbuildディレクトリ以下に成果物がコンパイルされて出来上がるのでのちにこれをfirebaseへデプロイする
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

# どのディレクトリを使うか聞かれるのでbuildを選択
? What do you want to use as your public directory? build

# シングルページアプリケーションなのかを聞かれるのでyesを選択（なんか最新って感じ）
? Configure as a single-page app (rewrite all urls to /index.html)? Yes

# build以下のindex.htmlを上書きするか聞かれるけど、事前にbuildしてたものを上書きしたくないのでNo選択
? File build/index.html already exists. Overwrite? No

✔  Firebase initialization complete!

# 完了したらデプロイしてみる
$ firebase deploy


# 下の方に出てくるhostingURLにアクセスできたらデプロイ成功！！
（上の方は違うURLなので注意、最初間違えてhostingできてないのかと勘違いしていた）
```
## おしまい

### 謎のハマりポイント
firebase deployまではできたけど、「リクエストの処理中に不明のエラーが発生しました。もう一度お試しください」の画面しか表示されない。（上記のようにURL間違えてただけの可能性は有る）

作成したwebappをbuildしてないじゃんってことに気づいたので下記実行してみるとエラーが出た
$ webdev build

```
 !  ~/A/asakawa_presentation   litalico_presentation *~…  webdev build                 2m  木 10/ 3 22:58:26 2019
[WARNING] Throwing away cached asset graph due to Dart SDK update.
[INFO] Cleaning up outputs from previous builds. completed, took 72ms
[INFO] Building new asset graph completed, took 2.0s
[INFO] Checking for unexpected pre-existing outputs. completed, took 3ms
[INFO]build_web_compilers:entrypoint on web/main.dart: Running dart2js with --minify --packages=.package-ad6faed33dc93ff8754afaa8b7e9af21 -oweb/main.dart.js web/main.dart
[WARNING] No actions completed for 15.0s, waiting on:
  - build_web_compilers:entrypoint on web/main.dart

[INFO]build_web_compilers:entrypoint on web/main.dart: Dart2Js finished with:

Compiled 20,601,600 characters Dart to 1,426,833 characters JavaScript in 24.9 seconds
Dart file web/main.dart compiled to JavaScript: web/main.dart.js
[INFO] Running build completed, took 30.4s
[INFO] Caching finalized dependency graph completed, took 200ms
[SEVERE] Unable to create merged directory at build.
Choose a different directory or delete the contents of that directory.
[SEVERE] FailureType: 73
[SEVERE] Unable to create merged directory for build.
[SEVERE] Failed after 30.6s
```

ここに注目
[SEVERE] Unable to create merged directory at build.
Choose a different directory or delete the contents of that directory.

buildした成果物を格納してるディレクトリがなんかおかしそうだったので一度build/を削除してから
もう一度$ webdev buildを実行するとうまくいった！（どうやらbuild/になにか自分で勝手にファイル生成してしまっていたみたい）

# ハマりポイント2
# firebase deployはうまくいったようだけど、変な画面が表示される
```
Welcome
Firebase Hosting Setup Complete
You're seeing this because you've successfully setup Firebase Hosting. Now it's time to go build something extraordinary!

OPEN HOSTING DOCUMENTATION
```
# 調べてみると、index.htmlがちゃんとwebappでbuildしたものでないためこの画面になってる模様（つまりデフォルト状態のhtmlをデプロイしちゃってる状態）
# これが参考になった：https://github.com/coreui/coreui-react/issues/55
# まずはちゃんとbuildしよう

$ webdev buildが失敗
```
 ~/A/flutter_web_slides   fix-README *  webdev build           土 10/12 20:33:50 2019
[INFO] Reading cached asset graph completed, took 322ms
[INFO] Checking for updates since last build completed, took 1.2s
[INFO]build_web_compilers:entrypoint on web/main.dart: Running dart2js with --minify --packages=.package-ad6faed33dc93ff8754afaa8b7e9af21 -oweb/main.dart.js web/main.dart
[WARNING] No actions completed for 15.1s, waiting on:
  - build_web_compilers:entrypoint on web/main.dart

[INFO]build_web_compilers:entrypoint on web/main.dart: Dart2Js finished with:

Compiled 20,601,605 characters Dart to 1,426,838 characters JavaScript in 19.5 seconds
Dart file web/main.dart compiled to JavaScript: web/main.dart.js
[INFO] Running build completed, took 21.3s
[INFO] Caching finalized dependency graph completed, took 200ms
[SEVERE] Unable to create merged directory at build.
Choose a different directory or delete the contents of that directory.
[SEVERE] Unable to create merged directory for build.
[SEVERE] Failed after 21.5s
[SEVERE] FailureType: 73
```

ここが怪しい：[SEVERE] Unable to create merged directory at build.
Choose a different directory or delete the contents of that directory.

/buildを確認してみると、index.htmlのファイルのみ存在したのでこれを削除

再度buildを実行（ビルドするとindex.htmlもまた生成される）
```
 !  ~/A/flutter_web_slides   fix-README *  webdev build
[INFO] Reading cached asset graph completed, took 277ms
[INFO] Checking for updates since last build completed, took 1.1s
[INFO] Running build completed, took 250ms
[INFO] Caching finalized dependency graph completed, took 195ms
[INFO] Creating merged output dir `build` completed, took 374ms
[INFO] Writing asset manifest completed, took 6ms
[INFO] Succeeded after 869ms with 0 outputs (0 actions)

# 成功

# ちゃんとbuildに成功した場合は、/web以下にあるindex.htmlと/build以下にあるindex.htmlの中身が同一になってる
# firebase initするときはこのindex.htmlを上書きしちゃわないように気をつけること
```
# build以下のindex.htmlを上書きするか聞かれるけど、事前にbuildしてたものを上書きしたくないのでNo選択
? File build/index.html already exists. Overwrite? No
```
```

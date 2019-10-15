import 'package:flutter_web/material.dart';
import 'package:asakawa_presentation/presentation_slides/title_slide.dart';
import 'package:asakawa_presentation/presentation_slides/default_slide.dart';
import 'package:asakawa_presentation/presentation_slides/image_slide.dart';
import 'package:asakawa_presentation/presentation_slides/table_of_contents.dart';
import 'package:asakawa_presentation/presentation_slides/single_image_single_text.dart';
import 'package:asakawa_presentation/presentation_slides/single_message_slide.dart';
import 'package:asakawa_presentation/presentation_slides/double_image_double_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asakawa House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        children: <Widget>[
          TitleSlide(
              title: "『LITALICOパワポ生成ツール in flutter web』",
              content:
                  "flutter web × firebase hostingを使った高速webページ制作。パワーポイントのデータをgithubで管理。決まったレイアウト構造のみを使うことで情報共有を便利に。パワポ作成が苦手なひとでもこれなら簡単。"),
          SingleImageSingleText(
              title: "本日ご紹介するのは「LITALICOパワポ生成ツール」",
              content: "flutter webを使って、会社のプレゼン用パワーポイントを簡単に作れちゃう",
              image: "yu-no-girl.jpg"),
          SingleMessageSlide(title: "え？なにそれ美味しいの？"),
          SingleMessageSlide(title: "目次"),
          TableOfContents(
            title: "LITALICOパワポ生成ツールの魅力",
            title_background_color: 0xfff3776A9,
            content_background_color: 0xfffA3CFDD,
            content1: "パワポ作成が苦手なひとでも文章とテキストを入れるだけで美しいレイアウトのスライドが作れる",
            content2: "コードを書くようにパワポを書ける",
            content3: "firebase hostingですぐにwebに公開できる",
          ),
          DoubleImageDoubleText(
              title: "パワポとflutter webの出来栄え比較",
              image1: "yu-no-girl.jpg",
              image2: "yu-no-girl.jpg",
              text1: "作成：powew point",
              text2: "作成：flutter web"),
          ImageSlide(image: "smash_brothers.png"),
          DefaultSlide(
              title: "意外と簡単に作れちゃう", content: "パワポはいじりたくないけどflutter webなら..！"),
          DefaultSlide(
              title: "一度作ったスライドって保存しておけないの？",
              content: "スライド保存機能、comming soon.."),
          DefaultSlide(
              title: "フォーム入力したら生成してくれたらいいのに..",
              content: "スライド作成機能、comming soon.."),
          SingleMessageSlide(title: "開発協力者、随時募集中！"),
          SingleMessageSlide(title: "おしまい"),
        ],
      ),
    );
  }
}

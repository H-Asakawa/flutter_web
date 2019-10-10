import 'package:flutter_web/material.dart';
import 'package:asakawa_presentation/presentation_slides/title_slide.dart';
import 'package:asakawa_presentation/presentation_slides/default_slide.dart';
import 'package:asakawa_presentation/presentation_slides/image_slide.dart';
import 'package:asakawa_presentation/presentation_slides/table_of_contents.dart';
import 'package:asakawa_presentation/presentation_slides/single_image_single_text.dart';

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
          SingleImageSingleText(
              title: "本日ご紹介するのは「この世の果てで恋を歌う少女YU-NO」",
              content: "９０年代の超名作！全てのノベルゲーム開発者が立ち返るべきバイブル",
              image: "yu-no-girl.jpg"),
          TitleSlide(
              title: "この世の果てで恋を歌う少女YU-NO",
              content:
                  "『この世の果てで恋を唄う少女YU-NO』（このよのはてでこいをうたうしょうじょ ユーノ、英題：YU-NO：A girl who chants love at the bound of this world.）は、菅野ひろゆき[注 1]が企画・脚本・ゲームデザイン・総合プロデュースを担当し、エルフにて開発販売したSFアドベンチャーゲーム[1]。PC-98、セガサターン、Windowsで発売されたほか、リメイク版も発売されている。また、アダルトアニメ化、漫画化、小説化、全年齢向けテレビアニメ化もされた。"),
          TableOfContents(
            title: "並列世界構成原理",
            title_background_color: 0xfff3776A9,
            content_background_color: 0xfffA3CFDD,
            content1: "ブリンダーの木",
            content2: "事象のシュヴァルツシェルト半径",
            content3: "次元監査官",
          ),
          ImageSlide(image: "smash_brothers.png"),
          DefaultSlide(title: "3枚目のスライド", content: "え、もしや作るのめっちゃ楽なのでは"),
          DefaultSlide(title: "4枚目のスライド", content: "基本レイアウト構成で5枚分くらい作るか..."),
        ],
      ),
    );
  }
}

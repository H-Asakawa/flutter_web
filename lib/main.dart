import 'package:asakawa_presentation/presentation_slides/column_two.dart';
import 'package:flutter_web/material.dart';
import 'package:asakawa_presentation/presentation_slides/default_slide.dart';
import 'package:asakawa_presentation/presentation_slides/image_slide.dart';
import 'package:asakawa_presentation/presentation_slides/slide_two.dart';

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
          DefaultSlide(title: "メインタイトル", content: "ここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してください"),
          ImageSlide(image: "smash_brothers.png"),
          DefaultSlide(title: "3枚目のスライド", content: "え、もしや作るのめっちゃ楽なのでは"),
          DefaultSlide(title: "4枚目のスライド", content: "基本レイアウト構成で5枚分くらい作るか..."),
          ColumnTwo(),
          SlideTwo(),
        ],
      ),
    );
  }
}

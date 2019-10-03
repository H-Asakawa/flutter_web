import 'package:flutter_web/material.dart';
import 'package:asakawa_presentation/presentation_slides/default_slide.dart';
import 'package:asakawa_presentation/presentation_slides/slide_two.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        children: <Widget>[
          DefaultSlide(title: "メインタイトル",content: "ここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してくださいここに文章を入力してください"),
          DefaultSlide(title: "2枚目のスライド",content: "意外と作るのが楽になるかも"),
          DefaultSlide(title: "3枚目のスライド",content: "え、もしやめっちゃ楽なのでは"),
          SlideTwo(),
        ],
      ),
    );
  }
}

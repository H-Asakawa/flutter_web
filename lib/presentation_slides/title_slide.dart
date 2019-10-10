import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:asakawa_presentation/presentation_slides/slide_date.dart';
import 'package:asakawa_presentation/presentation_slides/flutter_caption.dart';

class TitleSlide extends StatelessWidget {
  const TitleSlide({this.title, this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white70,
        child: Stack(
          children: <Widget>[
            SlideDate(),
            FlutterCaption(),
            Positioned(
              left: 100,
              top: 120,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 100,
              top: 300,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  content,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('litalico_slide_footer.png'),
            ),
          ],
        ),
      ),
    );
  }
}

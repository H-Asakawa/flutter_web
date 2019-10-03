import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:asakawa_presentation/presentation_slides/slide_date.dart';

class DefaultSlide extends StatelessWidget {
  const DefaultSlide({this.title, this.content});

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
            Positioned(
              left: 100,
              top: 80,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 100,
              top: 350,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  content,
                  softWrap: true,
                  maxLines: 5,
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

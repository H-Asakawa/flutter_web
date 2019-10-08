import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:asakawa_presentation/presentation_slides/flutter_caption.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white70,
        child: Stack(
          children: <Widget>[
            FlutterCaption(),
            Center(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 80, horizontal: 50),
              child: Image.asset(image),
            )),
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

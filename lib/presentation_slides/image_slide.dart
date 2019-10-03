import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:intl/intl.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMMMd('ja');
    var date = format.format(DateTime.now());

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white70,
        child: Stack(
          children: <Widget>[
            Positioned(
              right: 30,
              top: 20,
              child: Row(
                children: <Widget>[
                  Text(
                    date,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  FlutterLogo(
                    size: 40,
                  ),
                ],
              ),
            ),
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

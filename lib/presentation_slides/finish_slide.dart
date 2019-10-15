import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:asakawa_presentation/presentation_slides/flutter_caption.dart';

class FinishSlide extends StatelessWidget {
  const FinishSlide({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('litalico_slide_footer.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

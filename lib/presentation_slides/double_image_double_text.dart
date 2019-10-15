import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class DoubleImageDoubleText extends StatelessWidget {
  const DoubleImageDoubleText(
      {this.title, this.image1, this.image2, this.text1, this.text2});

  final String title;
  final String image1;
  final String image2;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          image1,
                          fit: BoxFit.contain,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              text1,
                              softWrap: true,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          image2,
                          fit: BoxFit.contain,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              text2,
                              softWrap: true,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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

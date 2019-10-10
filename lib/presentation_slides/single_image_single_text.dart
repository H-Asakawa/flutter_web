import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class SingleImageSingleText extends StatelessWidget {
  const SingleImageSingleText({
    this.title,
    this.content,
    this.image,
  });

  final String title;
  final String content;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                  child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Center(
                      child: Text(
                        content,
                        softWrap: true,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                          child: Image.asset(
                        image,
                        fit: BoxFit.contain,
                      )),
                    )),
              ],
            ),
          )
          // ),
        ],
      ),
    );
  }
}

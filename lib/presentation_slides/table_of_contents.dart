import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class TableOfContents extends StatelessWidget {
  const TableOfContents(
      {this.title_background_color,
      this.title,
      this.content_background_color,
      this.content1,
      this.content2,
      this.content3});

  final int title_background_color;
  final String title;
  final int content_background_color;
  final String content1;
  final String content2;
  final String content3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            color: Color(title_background_color),
            width: MediaQuery.of(context).size.width * 0.4,
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            color: Color(content_background_color),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "・" + content1,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      "・" + content2,
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      "・" + content3,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                )
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }
}

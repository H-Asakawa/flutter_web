import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class ColumnTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            color: Color(0xfff7c143),
            width: MediaQuery.of(context).size.width * 0.35,
            child: Center(
              child: Text("構成要素",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "・猜疑",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "・警戒",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "・乱高下",
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

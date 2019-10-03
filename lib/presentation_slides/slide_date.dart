import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:intl/intl.dart';

class SlideDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var format = DateFormat.yMMMd('ja');
    var date = format.format(DateTime.now());

    return Positioned(
      right: 30,
      top: 20,
      child: Row(
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          FlutterLogo(
            size: 40,
          ),
        ],
      ),
    );
  }
}

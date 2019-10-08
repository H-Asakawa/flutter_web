import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class FlutterCaption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 30,
      top: 20,
      child: Row(
        children: <Widget>[
          FlutterLogo(
            size: 40,
          ),
          SizedBox(width: 8.0),
          Text(
            'Flutter Web',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

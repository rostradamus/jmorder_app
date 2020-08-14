import 'package:flutter/material.dart';

class StaffsView extends StatelessWidget {
  static const int viewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child:
                CircularProgressIndicator(backgroundColor: Colors.transparent),
          ),
        ],
      ),
    );
  }
}

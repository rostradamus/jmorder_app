import 'package:flutter/material.dart';

class FriendsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

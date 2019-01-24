import 'package:flutter/material.dart';
import './row-span.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RowSpan(),
          Icon(Icons.home, size: 150.0, color: Colors.black12),
          Text("Home tab content")
        ],
      ));
}

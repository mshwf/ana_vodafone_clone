import 'package:flutter/material.dart';

class NewSearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<NewSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Text('Hello'),
        ),
      ),
    );
  }
}

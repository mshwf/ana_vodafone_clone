import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Stack(
                  alignment: FractionalOffset.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Search',
                        style:
                            TextStyle(fontSize: 26, color: Color(0xFF333333)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'images/ic_icon_close.png',
                          height: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Stack(
                  alignment: FractionalOffset.center,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search for',
                        hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onLongPressStart: (details) {
                        print('{{{{{LONGPRESS START}}}}}');
                      },
                      onLongPressEnd: (details) {
                        print('{{{{{LONGPRESS END}}}}}');
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'images/mic.png',
                          height: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Text('Use the mic for searching or taking an action')
            ],
          ),
        ),
      ),
    );
  }
}

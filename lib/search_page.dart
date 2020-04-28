import 'dart:math';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

bool _voiceOn = false;
Random random = Random();
AnimationController _baseController;
AnimationController _controller;

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _baseController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _controller = _baseController..drive(CurveTween(curve: Curves.bounceIn));
  }

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
                    Visibility(
                      visible: !_voiceOn,
                      child: TextField(
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
                    ),
                    Visibility(
                      visible: _voiceOn,
                      child: SizedBox(
                        width: 144,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: _createLines(),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTapCancel: () {
                        _controller.stop();
                      },
                      onTap: () {
                        _startVoice();
                      },
                      onLongPressStart: (details) {
                        _startVoice();
                      },
                      onLongPressEnd: (details) {
                        _endVoice();
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
              Text('Use the mic for searching or taking an action'),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createLines() => List.generate(
      36,
      (i) => SizeTransition(
            sizeFactor: CurvedAnimation(
                parent: _baseController,
                curve: SineCurve(count: _getRandom(1, 8).toDouble()),
                reverseCurve: Curves.slowMiddle),
            child: Container(
              width: 2,
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
          ));

  void _startVoice() {
    _controller.repeat();
    setState(() {
      _voiceOn = true;
    });
  }

  void _endVoice() {
    _controller.stop();
    setState(() {
      _voiceOn = false;
    });
  }
}

int _getRandom(int min, int max) {
  return random.nextInt(max) + min;
}

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count});

  @override
  double transformInternal(double t) => sin(count * 2 * pi * t) * 0.5 + 0.5;
}

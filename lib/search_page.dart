import 'dart:math';

import 'package:ana_vodafone_clone/utils/space.dart';
import 'package:flutter/material.dart';

import 'models/search_result.dart';
import 'services/search_service.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

bool _voiceOn = false;
Random random = Random();
AnimationController _baseController;
SearchService _searchService = SearchService();
List<SearchResult> _searchResults = List<SearchResult>();

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  get _hasSearchResult => _searchResults.length > 0;

  @override
  void initState() {
    super.initState();
    _baseController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: SingleChildScrollView(
          child: Container(
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
                    alignment: FractionalOffset.centerRight,
                    children: <Widget>[
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: !_voiceOn,
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              _searchResults = _searchService.search(txt);
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search for',
                            hintStyle: TextStyle(color: Color(0xFFCCCCCC)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, style: BorderStyle.none),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                )),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Visibility(
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
                      ),
                      GestureDetector(
                        onLongPressStart: (details) {
                          _startVoice();
                        },
                        onLongPressEnd: (details) {
                          _endVoice();
                        },
                        child: Container(
                          child: Icon(
                            Icons.mic_none,
                            size: 22,
                            color: _voiceOn ? Colors.white : Colors.red,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _voiceOn ? Colors.red : Colors.white,
                          ),
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(10),
                        ),
                      )
                    ],
                  ),
                ),
                Text('Use the mic for searching or taking an action'),
                Text(
                  'Quick action',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Renew flex bundle'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'images/red_arrow_right.png',
                            height: 18,
                          ),
                        )
                      ],
                    )),
                Container(
                  height: 1,
                  color: const Color(0xFFCCCCCC),
                ),
                FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Renew mobile internet'),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            'images/red_arrow_right.png',
                            height: 18,
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Search results ${_getSearchCount(_searchResults.length)}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Visibility(
                  visible: !_hasSearchResult,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('Your search results will appear here')),
                ),
                Visibility(
                  visible: _hasSearchResult,
                  child: Column(
                    children: withSpace(
                        verticalSpace: 15,
                        children: _searchResults.map((r) {
                          return RaisedButton(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: withSpace(
                                        verticalSpace: 5,
                                        children: <Widget>[
                                          Text(
                                            r.title,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            r.section,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ]),
                                  ),
                                  Image.asset(
                                    'images/red_arrow_right.png',
                                    height: 30,
                                  )
                                ],
                              ));
                        }).toList()),
                  ),
                )
              ],
            ),
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
              curve: SineCurve(count: _getRandom(1, 5).toDouble()),
            ),
            child: Container(
              width: 2.5,
              height: _getLength(
                  index: i + 1, indexWeight: 5, count: 36, sections: 3),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(5), bottom: Radius.circular(5))),
            ),
          ));

  void _startVoice() {
    _baseController.repeat();
    setState(() {
      _voiceOn = true;
    });
  }

  void _endVoice() {
    _baseController.stop();
    setState(() {
      _voiceOn = false;
    });
  }

  double _generateHeight(int i) {
    int j = i + 1;
    if (j == 1 || j == 12 || j == 13 || j == 24 || j == 25 || j == 36) return 4;

    if (j == 2 || j == 11 || j == 14 || j == 23 || j == 26 || j == 35) return 8;

    if (j == 3 || j == 10 || j == 15 || j == 22 || j == 27 || j == 34)
      return 12;

    if (j == 4 || j == 9 || j == 16 || j == 21 || j == 28 || j == 33) return 16;

    if (j == 5 || j == 8 || j == 17 || j == 20 || j == 29 || j == 32) return 20;

    if (j == 6 || j == 7 || j == 18 || j == 19 || j == 30 || j == 31)
      return 24;
    else
      return 25;
  }

  String _getSearchCount(int length) {
    return length > 0 ? '($length)' : '';
  }
}

int _getRandom(int min, int max) => random.nextInt(max) + min;

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count});

  @override
  double transformInternal(double t) => sin(count * 2 * pi * t) * 0.5 + 0.5;
}

double _getLength({int index, double indexWeight, int count, int sections}) {
  assert(index <= count, "index can't be larger than count");
  assert(count % sections == 0,
      "can't generate $sections equal sections from  $count length");
  int sectionLength = count ~/ sections;
  // if (index == (sectionLength / 2) + 1) index--;

  var sectionIndex = index ~/ sectionLength;
  if (index % sectionLength == 0) sectionIndex--;
  int fallIndex = index - (sectionIndex * sectionLength);
  if (fallIndex > (sectionLength / 2) + 1) {
    fallIndex = sectionLength - fallIndex + 1;
  }
  return (fallIndex * indexWeight).toDouble();
}

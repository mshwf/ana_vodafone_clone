import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'app_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ana Vodafone - clone',
      theme: ThemeData(
        fontFamily: 'vodafone_rg_and_meduim',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        accentColor: Colors.red,
        textTheme: TextTheme(
            title: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
      ),
      home: MyHomePage(title: 'Ana Vodafone - clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PageController _pageViewController = PageController();
  TabController _tabController;
  AnimationController _counterController;
  Animation<double> animation;

  final double fixedFlexesLeft = 397;
  final double flexPackage = 600;
  double flexesLeft;

  @override
  void initState() {
    super.initState();

    flexesLeft = fixedFlexesLeft;
    _tabController = new TabController(length: 3, vsync: this)
      ..addListener(tabChanged);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      endDrawer: AppDrawer(),
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/vodafone_logo_new.png',
                      width: 40,
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 0.0,
                      fillColor: Color(0xFFEAEAEA),
                      child: Icon(
                        Icons.search,
                        size: 25.0,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    )
                  ]),
            ),
            SizedBox(
              height: 200,
              child: PageView(
                controller: _pageViewController,
                children: <Widget>[
                  Card(
                      elevation: 0,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Image.asset(
                        'images/free400.png',
                        fit: BoxFit.none,
                      )),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Recharge now',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'You\'re running out of balance, recharge now with no\nhassle',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: VodafoneButton('Recharge')),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 218,
              width: 500,
              child: Card(
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: DefaultTabController(
                    length: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.red,
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Container(
                                padding: EdgeInsets.all(18),
                                child: Text(
                                  'Flex',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Internet',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Roaming',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ]),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontFamily:
                                                      'vodafone_rg_and_meduim'),
                                              children: [
                                                TextSpan(
                                                    text:
                                                        '${flexesLeft.round()} ',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'vodafone_rg_and_meduim',
                                                      fontSize: 35,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    )),
                                                TextSpan(text: 'left of '),
                                                TextSpan(
                                                    text:
                                                        '${flexPackage.round()} ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(text: 'Flexes')
                                              ]),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        LinearProgressIndicator(
                                          backgroundColor: Color(0xFFF4F4F4),
                                          value: flexesLeft / flexPackage,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontFamily:
                                                          'vodafone_rg_and_meduim'),
                                                  children: [
                                                    TextSpan(
                                                        text: '27 days ',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    TextSpan(text: 'to renew')
                                                  ]),
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Transform(
                                                  alignment: Alignment.center,
                                                  transform: Matrix4.rotationY(
                                                      math.pi),
                                                  child: Icon(
                                                    Icons.refresh,
                                                    size: 15,
                                                    color: Color(0xFF333333),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('Last updated 8:33 PM')
                                              ],
                                            )
                                          ],
                                        ),
                                        OutlineButton(
                                          borderSide: BorderSide(
                                              width: 1.0, color: Colors.red),
                                          child: Text('Manage'),
                                          onPressed: () {},
                                          color: Colors.red,
                                          textColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'images/ic_empty_mi.png',
                                          width: 80,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'You are not subscribed to any \nbundle.',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    VodafoneButton('Subscibe')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset(
                                          'images/ic_empty_roaming.png',
                                          width: 80,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'You are not subscribed to any \nbundle.',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    VodafoneButton('Subscibe')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void tabChanged() {
    if (_tabController.index == 0) {
      setState(() {
        _counterController = AnimationController(
            duration: const Duration(milliseconds: 400), vsync: this);
        animation = Tween<double>(begin: flexPackage, end: fixedFlexesLeft)
            .chain(CurveTween(curve: Curves.easeOut))
            .animate(_counterController)
              ..addListener(() {
                setState(() {
                  flexesLeft = animation.value;
                });
              });

        _counterController.forward();
      });
    }
  }
}

class VodafoneButton extends StatelessWidget {
  const VodafoneButton(
    this.buttonText, {
    Key key,
  }) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(10),
      color: Colors.red,
      textColor: Colors.white,
      highlightColor: Colors.red[900],
      onPressed: () {},
      child: Text(buttonText),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}

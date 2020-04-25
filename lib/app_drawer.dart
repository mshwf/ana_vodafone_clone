import 'package:ana_vodafone_clone/my_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'dashed_line.dart';

class AppDrawer extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();

    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Drawer(
          child: Container(
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment(2, -8),
                          end: Alignment(2, 1))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          DrawerTopIcon(image: 'images/home.png', text: 'Home'),
                          DrawerTopIcon(
                              image: 'images/phone.png', text: 'My plan'),
                          DrawerTopIcon(
                              image: 'images/data.png',
                              text: 'Mobile\ninternet'),
                          DrawerTopIcon(
                              image: 'images/geny.png', text: 'Flex 365'),
                          DrawerTopIcon(
                              image: 'images/transfer.png',
                              text: 'Balance\ntransfer'),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                DashedLine.defaultDash(),
                DrawerButton(
                    image: 'images/recharge_and_balance.png',
                    text: 'Recharge and balance'),
                // FlatButton.icon(
                //     onPressed: () {},
                //     icon: Image.asset(
                //       'images/recharge_and_balance.png',
                //       height: 45,
                //     ),
                //     label: Text(
                //       'Recharge and balance',
                //       style: TextStyle(fontSize: 15),
                //     )),
                DashedLine.defaultDash(),
                DrawerButton(
                    image: 'images/manage_flex.png', text: 'Manage Flex'),
                DashedLine.defaultDash(),
                DrawerButton(
                  image: 'images/customize_my_offer.png',
                  text: 'Customize my offer',
                  isNew: true,
                ),
                DashedLine.defaultDash(),
                DrawerButton(
                  image: 'images/team010.png',
                  text: 'Team010',
                  isNew: true,
                ),
                DashedLine.defaultDash(),
                DrawerButton(
                    image: 'images/vodafone_cash.png', text: 'Vodafone Cash'),
                DashedLine.defaultDash(),
                DrawerButton(image: 'images/dsl.png', text: 'DSL'),
                DashedLine.defaultDash(),
                DrawerButton(
                    image: 'images/chat_with_us.png',
                    text: 'Chat with us',
                    isNew: true),
                DashedLine.defaultDash(),
                DrawerButton(
                  image: 'images/entertainment.png',
                  text: 'Entertainment',
                  isNew: true,
                ),
                DashedLine.defaultDash(),
                DrawerButton(image: 'images/shop.png', text: 'Shop'),
                DashedLine.defaultDash(),
                ServicesList(
                    globalKey: expansionTileKey, controller: _scrollController),
                DrawerButton(image: 'images/logout.png', text: 'Logout'),
                DashedLine.defaultDash(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  double previousOffset;

  ServicesList({
    Key key,
    GlobalKey globalKey,
    ScrollController controller,
  }) : super(key: key) {
    _scrollController = controller;
    myKey = globalKey;
  }
  GlobalKey myKey;
  ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      onExpansionChanged: (isExpanded) {
        if (isExpanded) previousOffset = _scrollController.offset;
        _scrollToSelectedContent(isExpanded, previousOffset, index, myKey);
      },
      myKey: myKey,
      title: Text(
        'Services',
        style: TextStyle(fontSize: 16),
      ),
      controller: _scrollController,
      backgroundColor: Color(0xFFF4F4F4),
      children: <Widget>[
        DrawerButton(image: 'images/salefny.png', text: 'Sallefny shokran'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/usb.png', text: 'USB'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/white_list.png', text: 'Whitelist'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/black_list.png', text: 'Blacklist'),
        DashedLine.defaultDash(),
        DrawerButton(
            image: 'images/missed_call_keeper.png', text: 'Missed Call Keeper'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/my_red_family.png', text: 'My Red Family'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/ala_7saby.png', text: '3ala 7esaby'),
        DashedLine.defaultDash(),
        DrawerButton(
            image: 'images/edfa3ly_shokran.png', text: 'Edfa3ly Shokran'),
        DashedLine.defaultDash(),
        DrawerButton(
            image: 'images/kalemny_shokran.png', text: 'Kallemny Shokran'),
        DashedLine.defaultDash(),
        DrawerButton(image: 'images/store_locator.png', text: 'Store Locator'),
        DashedLine.defaultDash(),
        DrawerButton(
          image: 'images/roaming.png',
          text: 'Roaming',
          isNew: true,
        ),
        DashedLine.defaultDash(),
        DrawerButton(
            image: 'images/alerting_services.png', text: 'Alerting services'),
      ],
    );
  }

  void _scrollToSelectedContent(
      bool isExpanded, double previousOffset, int index, expansionTileKey) {
    final keyContext = myKey.currentContext;

    if (keyContext != null) {
      // make sure that your widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      _scrollController.animateTo(
          isExpanded ? (box.size.height * index) : previousOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear);
    }
  }
}

class DrawerButton extends StatelessWidget {
  final String image;
  final String text;
  final bool isNew;
  const DrawerButton({
    Key key,
    this.image,
    this.text,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                image,
                height: 45,
              ),
              SizedBox(width: 12),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          if (isNew)
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: Colors.red),
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
              child: Text(
                'New',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
        ],
      ),
      onPressed: () {},
    );
  }
}

class DrawerTopIcon extends StatelessWidget {
  const DrawerTopIcon({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Image.asset(
            image,
            width: 45,
          ),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}

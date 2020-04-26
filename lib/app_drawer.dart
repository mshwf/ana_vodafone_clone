import 'package:ana_vodafone_clone/my_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'dashed_line.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey expansionTileKey = GlobalKey();

    GlobalKey lastDashKey = GlobalKey();

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
                        child: Image.asset(
                          'images/ic_icon_close.png',
                          height: 22,
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
                  // key: expansionTileKey,
                  controller: _scrollController,
                  expansionChanged: (expanded) {
                    if (expanded) {
                      // RenderBox expansion =
                      //     expansionTileKey.currentContext.findRenderObject();
                      RenderBox linebox =
                          lastDashKey.currentContext.findRenderObject();
                      Offset position = linebox.localToGlobal(Offset.zero);
                      double lineY = position.dy;
                      setState(() {
                        var ctx = lastDashKey.currentContext;
                        // Offset positionEx =
                        //     expansion.localToGlobal(Offset.zero);
                        // double expY = positionEx.dy;

                        Future.delayed(Duration(milliseconds: 200), () {
                          var height = 660.0;

                          print('LineY=$lineY');
                          _scrollController.animateTo(
                            height,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 200),
                          );
                        });
                      });
                    }
                  },
                ),
                DashedLine.defaultDash(key: lastDashKey),
                DrawerButton(image: 'images/logout.png', text: 'Logout'),
                DashedLine.defaultDash(),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServicesList extends StatefulWidget {
  ServicesList({
    Key key,
    this.expansionChanged,
    GlobalKey globalKey,
    ScrollController controller,
  }) : super(key: key);
  GlobalKey myKey;
  ValueChanged<bool> expansionChanged;
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  @override
  Widget build(BuildContext context) {
    return MyExpansionTile(
      onExpansionChanged: super.widget.expansionChanged,
      title: Text(
        'Services',
        style: TextStyle(fontSize: 16),
      ),
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
        // DashedLine.defaultDash(),
      ],
    );
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

import 'package:flutter/material.dart';
import 'dashed_line.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Drawer(
          child: Container(
            child: ListView(
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
                ExpansionTile(
                  title: Text('ttxxg'),
                  backgroundColor: Color(0xFFF4F4F4),
                  children: <Widget>[Text('data')],
                ),
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
    return InkWell(
      onTap: () {},
      child: Padding(
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
                SizedBox(
                  width: 12,
                ),
                Text(text),
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
      ),
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

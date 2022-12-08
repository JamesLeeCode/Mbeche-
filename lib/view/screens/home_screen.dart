import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:wallet_ui_kit/provider/promo_provider.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/chatbot_screen.dart';
import 'package:wallet_ui_kit/view/screens/histroy_screen.dart';
import 'package:wallet_ui_kit/view/screens/mbeche_me.dart';
import 'package:wallet_ui_kit/view/screens/pay_screen.dart';
import 'package:wallet_ui_kit/view/screens/saving_account_screen.dart';
import 'package:wallet_ui_kit/view/screens/cashback_screen.dart';
import 'package:wallet_ui_kit/view/screens/charity_screen.dart';
import 'package:wallet_ui_kit/view/screens/e_shopping_screen.dart';
import 'package:wallet_ui_kit/view/screens/gift_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/screens/topup_screen.dart';
import 'package:wallet_ui_kit/view/widgets/promo_widget.dart';
import 'package:provider/provider.dart';

String userFirst;
String cellNumber ;
class PixalletHomeScreen extends StatefulWidget {
  @override
  _PixalletHomeScreenState createState() => _PixalletHomeScreenState();
}


class _PixalletHomeScreenState extends State<PixalletHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 7,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/Wihdrawals.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .where("email", isEqualTo: loggedInUser)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text('Loading...'));
                  } else {
                    DocumentSnapshot ds = snapshot.data.documents[0];
                    cellNumber = ds["phoneNumber"].toString();
                    /*  setState(() {
                        //userProfilePic = ds["imageUrl"].toString();
                        userFirst = ds["fnames"].toString() +
                                                  " " +
                                                  ds["sname"].toString();
                      }); */
                    return Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  Text("MBECHE",
                              style: poppinsBold.copyWith(
                                  fontSize: 25, color: ColorResources.COLOR_WHITE)),*/
                              Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.scaleDown,
                                height: 60,
                                width: 60,
                              ),
                              Stack(
                                overflow: Overflow.visible,
                                children: [
                                  Icon(Icons.notifications,
                                      size: 30,
                                      color: ColorResources.COLOR_WHITE),
                                  Positioned(
                                    right: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorResources
                                                .COLOR_DARK_ORCHID
                                                .withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            ColorResources.COLOR_WHITE,
                                        child: Text(Strings.TWO,
                                            style: TextStyle(fontSize: 8)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                spreadRadius: 3)
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                ds["imageUrl"].toString(),
                                              ),
                                              fit: BoxFit.cover)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              ds["fnames"].toString() +
                                                  " " +
                                                  ds["sname"].toString(),
                                              style: poppinsRegular.copyWith(
                                                  color: ColorResources
                                                      .COLOR_WHITE)),
                                          Text(
                                              Strings
                                                  .ACCOUNT_DETAILS25214, //ds["email"].toString(),
                                              style: poppinsRegular.copyWith(
                                                  color: ColorResources
                                                      .COLOR_VERY_LIGHT_GRAY)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 180,
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 20,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          //  borderRadius: BorderRadius.all(Radius.circular(20)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/stars.gif'),
                                              fit: BoxFit.cover)),
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 19,
                                          right: 22,
                                          bottom: 11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Nedbank Mobi Wallet Balance:",
                                              style: poppinsRegular.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DIM_GRAY)),
                                          Text(Strings.BALANCE_DOLLER,
                                              style: poppinsRegular.copyWith(
                                                  color: ColorResources
                                                      .COLOR_DARK_ORCHID)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 2,
                                      width: double.infinity,
                                      color: Colors.black87,
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                        color: Colors.black87,
                                        padding: EdgeInsets.only(
                                            left: 20, top: 19, right: 22),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MbecheMe()));
                                                },
                                                child: IconTitleColumnButton(
                                                  iconUrl:
                                                      'assets/Icon/send.png',
                                                  title: "Send",
                                                )),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SavingAccountScreen()));
                                              },
                                              child: IconTitleColumnButton(
                                                  iconUrl:
                                                      'assets/images/wallet.gif',
                                                  title: "My Wallet"),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                /*   Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TopUpScreen()));*/
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatbotScreen()));
                                              },
                                              child: IconTitleColumnButton(
                                                  iconUrl:
                                                      'assets/images/chatbot.gif',
                                                  title: "Chatbot"),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TopUpScreen()));
                                              },
                                              child: IconTitleColumnButton(
                                                  iconUrl:
                                                      'assets/Icon/topup.png',
                                                  title: "Top-Up"),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                child: Row(
                                  children: [
                                    IconTitleRowButton(
                                      widget: EShoppingScreen(),
                                      iconUrl: 'assets/Icon/shopping.png',
                                      title: Strings.E_SHOPPING,
                                    ),
                                    IconTitleRowButton(
                                      widget: GiftScreen(),
                                      iconUrl: 'assets/Icon/gift.png',
                                      title: Strings.GIFTS,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Row(
                                  children: [
                                    IconTitleRowButton(
                                      widget: PayScreen(),
                                      iconUrl: 'assets/Icon/bill payments.png',
                                      title: Strings.BILL_PAYMENT,
                                    ),
                                    IconTitleRowButton(
                                      widget: HistoryScreen(),
                                      iconUrl: 'assets/Icon/request.png',
                                      title: "History",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: Row(
                                  children: [
                                   /* IconTitleRowButton(
                                      widget: CharityScreen(),
                                      iconUrl: 'assets/Icon/charity.png',
                                      title: Strings.CHARITY,
                                    ), */
                                    IconTitleRowButton(
                                      widget: ValueAddedServices(),
                                      iconUrl: 'assets/Icon/cashback.png',
                                      title: "Value Added Services",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                                child:
                                    Text(Strings.PROMO, style: poppinsSemiBold),
                              ),
                              Container(
                                height: 85,
                                padding: EdgeInsets.only(left: 20),
                                child: ListView.builder(
                                  itemCount: Provider.of<PromoProvider>(context)
                                      .getPromoList()
                                      .length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return PromoWidget(
                                        Provider.of<PromoProvider>(context)
                                            .getPromoList()[index]);
                                  },
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}

class IconTitleColumnButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  IconTitleColumnButton({@required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 51,
          height: 51,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: ColorResources.COLOR_GHOST_WHITE,
              borderRadius: BorderRadius.circular(44)),
          child: Image.asset(iconUrl, fit: BoxFit.scaleDown),
        ),
        Text(title,
            style: poppinsRegular.copyWith(
                fontSize: Dimensions.FONT_SIZE_SMALL, color: Colors.white)),
      ],
    );
  }
}

class IconTitleRowButton extends StatelessWidget {
  final Widget widget;
  final String iconUrl;
  final String title;
  IconTitleRowButton(
      {this.widget, @required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (widget != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => widget));
          }
        },
        child: Row(
          children: [
            Container(
              width: 36,
              height: 35,
              child: Image.asset(iconUrl),
            ),
            SizedBox(width: 10),
            Text(title,
                style: poppinsRegular.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

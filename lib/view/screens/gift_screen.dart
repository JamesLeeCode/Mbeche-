import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/provider/gift_provider.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/startup_Screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/gift_card_widget.dart';
import 'package:provider/provider.dart';

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  int selectedCard = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.GIFT),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text(
                    Strings.SPECIAL_GIFT,
                    textAlign: TextAlign.center,
                    style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_CHARCOAL),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 25),
                    child: Text(
                      Strings.SEND_MONEY,
                      textAlign: TextAlign.center,
                      style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
                    ),
                  ),
                  SizedBox(height: 50),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          Provider.of<GiftProvider>(context).getGiftList()[selectedCard].imageUrl,
                          width: 185,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 150,
                    margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_SMALL),
                    child: ListView.builder(
                        itemCount: Provider.of<GiftProvider>(context).getGiftList().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedCard = index;
                              });
                            },
                            child: GiftCardWidget(Provider.of<GiftProvider>(context).getGiftList()[index], selectedCard == index),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CustomButton(btnTxt: Strings.CONTINUE, onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletStartupScreen()));
              }),
            ),
          ],
        ),
      ),
    );
  }
}

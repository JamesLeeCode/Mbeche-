import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/home_screen.dart';
import 'package:wallet_ui_kit/view/screens/startup_Screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';

class SendMoneyScreen3 extends StatelessWidget {
  final String phone;
  final String amount;
  SendMoneyScreen3(this.amount, this.phone);
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: Strings.SEND_MONEY_SUCCESS,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 80,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_GHOST_WHITE,
                  shape: BoxShape.circle),
              child: Image.asset('assets/Icon/send.png', fit: BoxFit.scaleDown),
            ),
            Text(
              Strings.YOU_SUCESSFULLY,
              textAlign: TextAlign.center,
              style: montserratSemiBold.copyWith(
                  color: ColorResources.COLOR_DIM_GRAY),
            ),
            Text(
              Strings.SENT_MONEY_TO_MARTINA,
              textAlign: TextAlign.center,
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.COLOR_CHARCOAL),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
              child: Text("R" + amount,
                  style: poppinsSemiBold.copyWith(
                      fontSize: 30, color: ColorResources.COLOR_DARK_ORCHID)),
            ),
            Container(
              margin: EdgeInsets.only(left: 58, right: 58),
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.COLOR_WHITE_SMOKE),
              child: Row(
                children: [
                  ClipRRect(
                      child: Image.asset('assets/images/person1.png',
                          width: 40, height: 40)),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    child: Text(
                     "+27"+ phone,
                      style: poppinsRegular.copyWith(
                          color: ColorResources.COLOR_CHARCOAL),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                Strings.TRANSACTION_DONE,
                textAlign: TextAlign.center,
                style: montserratSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    color: ColorResources.COLOR_DIM_GRAY),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: CustomButton(
                  btnTxt: Strings.DONE,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WalletStartupScreen()));
                  }),
            ),
          ],
        ));
  }
}

class FinishMbeche extends StatefulWidget {
  final String number;
  FinishMbeche(this.number);
  @override
  _FinishMbecheState createState() => _FinishMbecheState();
}

class _FinishMbecheState extends State<FinishMbeche> {
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: Strings.SEND_MONEY_SUCCESS,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 80,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_GHOST_WHITE,
                  shape: BoxShape.circle),
              child: Image.asset('assets/Icon/send.png', fit: BoxFit.scaleDown),
            ),
            Text(
              Strings.YOU_SUCESSFULLY,
              textAlign: TextAlign.center,
              style: montserratSemiBold.copyWith(
                  color: ColorResources.COLOR_DIM_GRAY),
            ),
            Text(
              "send a Please-Mbeche ",
              textAlign: TextAlign.center,
              style: poppinsSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_LARGE,
                  color: ColorResources.COLOR_CHARCOAL),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
              child: Text("R" + widget.number,
                  style: poppinsSemiBold.copyWith(
                      fontSize: 30, color: ColorResources.COLOR_DARK_ORCHID)),
            ),
            Container(
              margin: EdgeInsets.only(left: 58, right: 58),
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.COLOR_WHITE_SMOKE),
              child: Row(
                children: [
                  ClipRRect(
                      child: Image.asset('assets/images/person1.png',
                          width: 40, height: 40)),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    alignment: Alignment.center,
                    child: Text(
                      Strings.MARTINA_NATALIE,
                      style: poppinsRegular.copyWith(
                          color: ColorResources.COLOR_CHARCOAL),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                Strings.TRANSACTION_DONE,
                textAlign: TextAlign.center,
                style: montserratSemiBold.copyWith(
                    fontSize: Dimensions.FONT_SIZE_SMALL,
                    color: ColorResources.COLOR_DIM_GRAY),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: CustomButton(
                  btnTxt: Strings.DONE,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PixalletHomeScreen()));
                  }),
            ),
          ],
        ));
  }
}

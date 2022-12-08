import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/pay_fast_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';

TextEditingController payAmountContr = TextEditingController();

class AddMoneyInWallet extends StatefulWidget {
  @override
  _AddMoneyInWalletState createState() => _AddMoneyInWalletState();
}

class _AddMoneyInWalletState extends State<AddMoneyInWallet> {
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: "TOP UP YOUR WALLET",
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_GHOST_WHITE,
                  shape: BoxShape.circle),
              child: Image.asset('assets/Illustration/topup-pg.png',
                  fit: BoxFit.scaleDown),
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.COLOR_WHITE_SMOKE),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: ColorResources.COLOR_PRIMARY_DARK),
                      child: Text(Strings.AMOUNT,
                          style: poppinsRegular.copyWith(
                              color: ColorResources.COLOR_WHITE)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      controller: payAmountContr,
                      hintTxt: "250",
                      isPhoneNumber: false,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Wallet credit will incur R10 once off fee. Max deposit is R4 000 and minimum deposit is R15 ",
                style: poppinsRegular.copyWith(
                    color: ColorResources.COLOR_DIM_GRAY)),
            SizedBox(height: 20),
            /*Container(
          height: 40,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
          child: TextFormField(
            style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL),
            decoration: InputDecoration(hintText: Strings.ENTER_YOUR_REMARKS, border: InputBorder.none),
          ),
        ),
        SizedBox(height: 20),*/
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: CustomButton(
                  btnTxt: Strings.CONTINUE,
                  onTap: () {
                    if (payAmountContr.text.length < 2) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              MessageDialog("Invalid amount"));
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Payfast()));
                    }
                  }),
            ),
          ],
        ));
  }
}

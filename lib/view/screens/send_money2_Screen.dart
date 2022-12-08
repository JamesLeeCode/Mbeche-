import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/send_money3_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SendMoneyScreen2 extends StatefulWidget {
  @override
  _SendMoneyScreen2State createState() => _SendMoneyScreen2State();
}

class _SendMoneyScreen2State extends State<SendMoneyScreen2> {
  String currentText = '';
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController()
    ..text = "";
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: Strings.SEND_MONEY_OTP,
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
              child: Image.asset('assets/Icon/send.png', fit: BoxFit.scaleDown),
            ),
            Text(
              Strings.ENTER_4_DIGIT,
              textAlign: TextAlign.center,
              style: montserratSemiBold.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: ColorResources.COLOR_DIM_GRAY),
            ),
            Form(
              key: formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    length: 4,
                    appContext: context,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v.length < 3) {
                        return "I'm from validator";
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: ColorResources.COLOR_GRAY,
                      activeColor: ColorResources.COLOR_PRIMARY_DARK,
                      activeFillColor: hasError ? Colors.orange : Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            /*   Padding(
          padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
          child: CustomButton(btnTxt: Strings.CONTINUE, onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen3()));
          }),
        ),*/
            Text(
              Strings.RESEND_CODE_IN,
              style: poppinsRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: ColorResources.COLOR_DIM_GRAY),
            )
          ],
        ));
  }
}

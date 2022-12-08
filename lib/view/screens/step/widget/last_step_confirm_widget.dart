import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';

class LastStepConfirmWidget extends StatelessWidget {
  final Function onTap;
  LastStepConfirmWidget({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*0.6,
        child: Column(
          children: [
            Hero(
              tag: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                margin: EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'assets/Illustration/Id confirmation.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Center(
              child: Text(
                Strings.NOW_YOU_ARE,
                style: poppinsRegular.copyWith(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Strings.GET_READY,
              textAlign: TextAlign.center,
              style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                left: Dimensions.MARGIN_SIZE_DEFAULT,
                right: Dimensions.MARGIN_SIZE_DEFAULT,
                top: Dimensions.MARGIN_SIZE_DEFAULT,
              ),
              child: CustomButton(
                btnTxt: Strings.CONTINUE,
                onTap: () {
                  Navigator.pop(context);
                  onTap();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

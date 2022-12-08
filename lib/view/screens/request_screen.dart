import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';
/*
class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  TwilioFlutter twilioFlutter;
  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC1ac0072755332faa3ecbac0cb5ed5fee',
        authToken: '40c66085ece13ec15dc4e6b6ebc9dc29',
        twilioNumber: '+15097036781');

    super.initState();
  }

  final _phoneContr = TextEditingController();
  final _amountContr = TextEditingController();
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: _phoneContr.text,
        messageBody: 'Thabo is asking for a R' +
            _amountContr.text +
            ' Mbeche cash voucher. To approve please follow the link: https://play.google.com/store/apps/details?id=com.mbecheapplication');
  }

  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: Strings.REQUEST,
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
              child: Image.asset('assets/Illustration/request.png',
                  fit: BoxFit.scaleDown),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.COLOR_WHITE_SMOKE),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: ColorResources.COLOR_PRIMARY_DARK),
                      child: Text(Strings.REQUEST_TO,
                          style: poppinsRegular.copyWith(
                              color: ColorResources.COLOR_WHITE)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      controller: _phoneContr,
                      hintTxt: "+27740000000",
                      isPhoneNumber: true,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
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
                      controller: _amountContr,
                      hintTxt: "250",
                      isPhoneNumber: false,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
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
                    sendSms();
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen2()));
                  }),
            ),
          ],
        ));
  }
}
*/

class RequestScreen extends StatelessWidget {
  final _phonePhone = TextEditingController();
  final _amountPhone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SendMoneyWidget(
        title: Strings.REQUEST,
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
              child: Image.asset('assets/Illustration/request.png',
                  fit: BoxFit.scaleDown),
            ),
            /*   Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorResources.COLOR_WHITE_SMOKE),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          color: ColorResources.COLOR_PRIMARY_DARK),
                      child: Text(Strings.REQUEST_TO,
                          style: poppinsRegular.copyWith(
                              color: ColorResources.COLOR_WHITE)),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      controller: _amountPhone,
                      hintTxt: "+27740000000",
                      isPhoneNumber: true,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),*/
            Container(
              width: double.infinity,
              height: 44,
              margin: EdgeInsets.only(right: 20, left: 20),
              padding: EdgeInsets.only(left: 20, right: 10),
              decoration: BoxDecoration(
                  color: ColorResources.COLOR_WHITE,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  border: Border.all(
                      color: ColorResources.COLOR_WHITE_GRAY, width: 2)),
              child: Row(
                children: [
                  CountryCodePicker(
                    onChanged: print,
                    initialSelection: '+27',
                    favorite: ['+27'],
                    showCountryOnly: false,
                    textStyle: poppinsRegular.copyWith(
                      fontSize: 13,
                    ),
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  Expanded(
                    flex: 3,
                    child: CustomTextField(
                      hintTxt: Strings.MOBILE_NUMBER,
                      isPhoneNumber: true,
                      controller: _amountPhone,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
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
                      controller: _phonePhone,
                      hintTxt: "250",
                      isPhoneNumber: false,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
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
                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SendMoneyScreen2()));
                  }),
            ),
          ],
        ));
  }
}

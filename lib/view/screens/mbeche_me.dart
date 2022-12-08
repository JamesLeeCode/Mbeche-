import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:wallet_ui_kit/main.dart';
import 'package:wallet_ui_kit/services/database_services.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money2_Screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money3_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MbecheMe extends StatefulWidget {
  @override
  _MbecheMeState createState() => _MbecheMeState();
}

final amountContr = TextEditingController();

class _MbecheMeState extends State<MbecheMe> {
  String _validError;
  TwilioFlutter twilioFlutter;
  @override
  void initState() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC1ac0072755332faa3ecbac0cb5ed5fee',
        authToken: 'f8e8ef4f07f97a9588de15351f5c476f',
        twilioNumber: '+16205778336');

    super.initState();
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Please Mbeche', 'Your Please-Mbeche has been sent.', platform,
        payload: 'Please Mbeche ');
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }

  final _phoneContr = TextEditingController();
  // final _amountContr = TextEditingController();
  void sendSms(String user) async {
    bool valid = true;
    if (amountContr.text.length < 2) {
      setState(() {
        valid = false;
        _validError = "Please make sure you have entered a valid amount";
      });
    }

    if (_phoneContr.text.length < 9 || _phoneContr.text.length > 9) {
      setState(() {
        valid = false;
        _validError = "Please make sure you have entered a valid Phone Number";
      });
    }

    if (valid == true) {
      await twilioFlutter.sendSMS(
          toNumber: "+27" + _phoneContr.text,
          messageBody: 'Please Mbeche ' + user +
              ' is asking for  R' +
              amountContr.text +'. Open Mbeche app or download on Google Play Store(URL to store)' );

      DatabaseServices _db = DatabaseServices();
      String month = DateTime.now().month.toString();
      String day = DateTime.now().day.toString();

      if (DateTime.now().month < 10) {
        month = "0" + DateTime.now().month.toString();
      }
      if (DateTime.now().day < 10) {
        day = "0" + DateTime.now().day.toString();
      }
      String today = DateTime.now().year.toString() + "-" + month + "-" + day;
      await _db.addhistory(loggedInUser, "+27" + _phoneContr.text,
          amountContr.text, "Please-Mbeche", "Cash", today);
      showNotification();
      setState(() {
        loadingPage = false;
      });
      Navigator.of(context).pop();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => MessageDialog(_validError));
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadingPage
        ? LoadingPage()
        : SendMoneyWidget(
            title: "SMS",
            child: SingleChildScrollView(
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
                      /*  setState(() {
                        //userProfilePic = ds["imageUrl"].toString();
                        userFirst = ds["fnames"].toString() +
                                                  " " +
                                                  ds["sname"].toString();
                      }); */
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding:
                                EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_GHOST_WHITE,
                                shape: BoxShape.circle),
                            child: Image.asset(
                                'assets/Illustration/request.png',
                                fit: BoxFit.scaleDown),
                          ),
                          /*Container(
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
                                        color:
                                            ColorResources.COLOR_PRIMARY_DARK),
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
                          ),*/
                          Container(
                            width: double.infinity,
                            height: 44,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                                color: ColorResources.COLOR_WHITE,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(
                                    color: ColorResources.COLOR_WHITE_GRAY,
                                    width: 2)),
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
                                    controller: _phoneContr,
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
                                        color:
                                            ColorResources.COLOR_PRIMARY_DARK),
                                    child: Text(Strings.AMOUNT,
                                        style: poppinsRegular.copyWith(
                                            color: ColorResources.COLOR_WHITE)),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CustomTextField(
                                    controller: amountContr,
                                    hintTxt: "250",
                                    isPhoneNumber: false,
                                    textInputType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text("Maximum PLEASE MBECHE requests per day is 10.",
                              style: poppinsRegular.copyWith(
                                  color: ColorResources.COLOR_DIM_GRAY)),
                          SizedBox(height: 6),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.PADDING_SIZE_LARGE),
                              child: CustomButton(
                                  btnTxt: Strings.CONTINUE,
                                  onTap: () async {
                                    setState(() {
                                      loadingPage = true;
                                    });
                                    await sendSms(ds["fnames"].toString() +
                                        " " +
                                        ds["sname"].toString());

                                    setState(() {
                                      loadingPage = false;
                                    });
                                  })),
                        ],
                      );
                    }
                  }),
            ));
  }
}

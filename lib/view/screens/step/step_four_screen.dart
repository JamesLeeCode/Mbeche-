import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/main.dart';
import 'package:wallet_ui_kit/services/auth_services.dart';
import 'package:wallet_ui_kit/services/database_services.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_three_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/screens/step/step_one_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_two_screen.dart';

import '../startup_Screen.dart';
//import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'package:http/http.dart' as http;


showNotification() async {
  var android = new AndroidNotificationDetails(
      'id', 'channel ', 'description',
      priority: Priority.High, importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  await flutterLocalNotificationsPlugin.show(0, 'MBECHE REGISTRATION',
      'Your account has been setup and ready for use', platform,
      payload: 'Welcome to Mbeche ');
}

getWalletResult() async {
  var _token = 'Bearer $token';
  Map<String, String> mainheader = {
    "Content-Type": "Application/json",
    //"x-fapi-financial-id":"OB/2017/001",
    "Authorization": _token,
    "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
    "x-ibm-client-secret":
    "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
  };

  var url =
      'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/callbacks/' +
          callback;
  var response = await http.get(
    url,
    headers: mainheader,
  );
  print('Response status: ${response.statusCode}');
  print('Account Details: ${response.body}');
}

class StepFourScreen extends StatefulWidget {
  @override
  _StepFourScreenState createState() => _StepFourScreenState();
}

TextEditingController idControl = TextEditingController();

class _StepFourScreenState extends State<StepFourScreen> {
  WebViewPlusController _controller;
  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }


  void showNow() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height -  80,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                WebViewPlus(
                  onWebViewCreated: (controller) {
                    this._controller = controller;
                    controller.loadUrl(walletCallback);
                  },
                  onPageFinished: (url) {},
                  javascriptMode: JavascriptMode.unrestricted,
                ), // Show your Image
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton.icon(
                      color: Theme.of(context).accentColor,
                      textColor: Colors.white,
                      onPressed: () async {
                        setState(() {
                          loadingPage = false;
                        });
     await getWalletResult();

                        await showNotification();

     showDialog(
        context: context,
        builder: (BuildContext context) =>
            MessageDialog(namesControl.text +
                ", your account has been activated...You can now login. Thank You"));
     Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));

                        },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      label: Text('Close')),
                ),
              ],
            )
          ),
        );
      },
     );
  }


  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }

  String _validError;
  bool valid;
  AuthService _auth = AuthService();
  DatabaseServices _db = DatabaseServices();
  bool isRecommendedSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: loadingPage
          ? LoadingPage()
          : SafeArea(
              child: Column(
                children: [
                  CustomAppBar(
                    title: Strings.STEP4,
                  ),
                  Expanded(
                    child: ListView(
                     // physics: NeverScrollableScrollPhysics(),
                      children: [
                        Hero(
                          tag: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            margin: EdgeInsets.only(
                                left: 25, right: 25, bottom: 10),
                            padding: EdgeInsets.all(25),
                            child: Image.asset(
                              'assets/Illustration/Id-verify.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            Strings.ONE_STEP_AWAY,
                            style: poppinsRegular.copyWith(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          padding: EdgeInsets.only(left: 30, right: 20),
                          child: Text(
                            Strings.ONE_STEP_AWAY_CONTENT,
                            style: montserratSemiBold.copyWith(
                                fontSize: Dimensions.FONT_SIZE_SMALL),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 30, right: 20),
                            alignment: Alignment.center,
                            child: CustomTextField(
                                hintTxt: "Email Address",
                                isPhoneNumber: false,
                                controller: emailControl,
                                isEmail: true,
                                textInputType: TextInputType.emailAddress),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 30, right: 20),
                            alignment: Alignment.center,
                            child: CustomTextField(
                              hintTxt: "Password",
                              isPhoneNumber: false,
                              controller: passwordControl,
                              textInputType: TextInputType.visiblePassword,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                      left: Dimensions.MARGIN_SIZE_DEFAULT,
                      right: Dimensions.MARGIN_SIZE_DEFAULT,
                    ),
                    child: CustomButton(
                      btnTxt: Strings.CONTINUE,
                      onTap: () async {


                        setState(() {
                          loadingPage = true;
                        });
                        if (emailControl.text.length < 5) {
                          setState(() {
                            _validError =
                                "Please make sure you entered your email correctly";
                            valid = false;
                          });
                        }
                        if (passwordControl.text.length <= 6) {
                          setState(() {
                            _validError =
                                "Please make sure your password is more than 6 characters";
                            valid = false;
                          });
                        }

                        if (valid == false) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  MessageDialog(_validError));
                        } else {
                          try {
                            dynamic results =
                                await _auth.registerWithEmailAndPassword(
                                    emailControl.text, passwordControl.text);
                            results
                                ? await _db.addUsers(
                                    emailControl.text,
                                    namesControl.text,
                                    surnameControl.text,
                                    phoneControl.text,
                                    addressControl.text,
                                    "https://firebasestorage.googleapis.com/v0/b/mbeche-55c20.appspot.com/o/profile.png?alt=media&token=b6ee4b6c-ba4b-4d35-ba35-7945713308fb",
                                    idControl.text)
                                : showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        MessageDialog(
                                            "Error: " + firebaseError));
                            results
                                ? /*Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()))*/
                            showNow()
                                :  setState(() {
                              loadingPage = false;
                            });
                        /*    results
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        MessageDialog(namesControl.text +
                                            ", your account has been activited...You can now login. Thank You"))
                                : SizedBox();
                            results ? showNotification() : SizedBox(); */
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    MessageDialog("Error: " + e.string));
                          }


                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}



class Webview extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class MessageDialog extends StatelessWidget {
  final String message;
  MessageDialog(this.message);
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 3,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 2,
                      ),
                      FlatButton(
                          child: Text(
                            '  OK,Thanks  ',
                            style: TextStyle(),
                          ),
                          shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(15),
                          textColor: Colors.pink,
                          onPressed: () async {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ]),
        )));
  }
}

/*class Password extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 3,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          message,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 2,
                          ),
                          FlatButton(
                              child: Text(
                                '  OK,Thanks  ',
                                style: TextStyle(),
                              ),
                              shape: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.pink, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(15),
                              textColor: Colors.pink,
                              onPressed: () async {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
} */

class NewScreen extends StatelessWidget {
  String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(payload),
      ),
    );
  }
}

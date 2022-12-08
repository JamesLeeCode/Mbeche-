import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:wallet_ui_kit/main.dart';
import 'package:wallet_ui_kit/services/database_services.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/mbeche_me.dart';
import 'package:wallet_ui_kit/view/screens/home_screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money3_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/login_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

TextEditingController payAmountContr = TextEditingController();

class Withdrawal extends StatefulWidget {
  @override
  _WithdrawalState createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
 WebViewPlusController _controller;
  String token;
  String _validError;
  getToken() async {
    Map<String, String> mainheader = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nboauth/oauth20/token';
    var response = await http.post(
      url,
      headers: mainheader,
      body: {
        'client_id': '1ec68e41-ffce-4309-9c44-eb6f5196dc8e',
        'client_secret': 'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX',
        'grant_type': 'client_credentials',
        'scope': 'tpp_client_credential'
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      token = jsonResponse['access_token'];
      print('Token is: $token.');
      Map data = {
        "Data": {
          "Permissions": ["ReadBalance"],
          "WalletId": "55"
        }
      };
      String url =
          'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/subscriptions';
      //  print(await getIntent(url, data) );
      if (transferType == "eft") {
        await getIntentEft();
      } else {
        await getIntentATM();
      }
      //await getWalletDetails();
      await requestHeavyToken();
      /*  await getHeavyToken();
      if (transferType == "eft") {
       await eft();
      } else {
        await peerToPeer();
      }*/

      //await getWalletDetails();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getIntent() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/subscriptions';
    Map jsonData = {
      "Data": {
        "Permissions": ["DoPeer2Peer"],
        "WalletId": "55",
        "ToWalletId": "66",
        "Amount": "70"
      }
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    print('Response status: $reply');
    var jsonResponse = convert.jsonDecode(reply);
    print('decode: $jsonResponse');
    var subscriptionId = jsonResponse['Data']['subscription_id'];
    subId = subscriptionId;
    print('subscription_id is: $subscriptionId');


  }



 getIntentATM() async {
   var url =
       'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/subscriptions';
   Map jsonData = {
     "Data": {"Permissions": ["DoATM"],"WalletId": "55", "Amount":"70"}
   }  ;
   var _token = 'Bearer $token';
   HttpClient httpClient = new HttpClient();
   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
   request.headers.set('content-type', 'application/json');
   request.headers.set('x-fapi-financial-id', 'OB/2017/001');
   request.headers.set('Authorization', _token);
   request.headers
       .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
   request.headers.set('x-ibm-client-secret',
       'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
   request.add(utf8.encode(json.encode(jsonData)));
   HttpClientResponse response = await request.close();
   // await utf8.decoder.bind(response).forEach(print);
   String reply = await utf8.decoder.bind(response).join();
   httpClient.close();
   print('Response status ATM: $reply');
   var jsonResponse = convert.jsonDecode(reply);
   print('decode: $jsonResponse');
   var subscriptionId = jsonResponse['Data']['subscription_id'];
   subId = subscriptionId;
   print('subscription_id is: $subscriptionId');


 }

  getIntentEft() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/subscriptions';
    Map jsonData = {
      "Data": { "Permissions": ["DoEFT"],"WalletId": "55", "Amount": "70"}
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    print('Response status: $reply');
    var jsonResponse = convert.jsonDecode(reply);
    print('decode: $jsonResponse');
    var subscriptionId = jsonResponse['Data']['subscription_id'];
    subId = subscriptionId;
    print('subscription_id is: $subscriptionId');


  }

  String subId;
  consentRemovals() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/consent-removals';

    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    //request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    // request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    print('Consent Removals: $reply');


  }
  requestHeavyToken() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/identity/customer/approve';
    Map jsonData = {"Message": "testing", "Channel": "412", "WalletID": "55"};
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('x-nb-subscription-id', subId);
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    //dH0yT8tJ0lL8fB5jL3vO1gQ6tO6jD6hQ3iC3cM6sV5kV8eE3hY
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    var jsonResponse = convert.jsonDecode(reply);
    newHeavyToken = jsonResponse['CallbackId'];
    print('Request for Heavy: $reply.');
    heavytokenLink = jsonResponse['AuthUrl'];
    showNow();
    //print('Create wallet results : $reply');
  }

  String newHeavyToken;
  getHeavyToken() async {
    //await getSecondToken();
    Map<String, String> mainheader = {
      "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer",
      "scope": "openid,ias,bcustomers,wallet,onboarding",
      "Authorization": "Bearer " + token,
      "wallet-id" : "55",
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
      "callback-id": newHeavyToken,
      "redirect_uri": "www.mbeche.com/store",
      "x-nb-subscription-id": subId,
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/identity/customer/approve';
    var response = await http.get(
      url,
      headers: mainheader,
    );
    // print('Response status: ${response.statusCode}');
    print('Heavy token: ${response.body}');
    var jsonResponse = convert.jsonDecode(response.body);
    token = jsonResponse['access_token'];
    // print('Heavy Token is: $token.');
  }

  peerToPeer() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/p2p-transfers';

    Map jsonData = {
      "Amount": 70,
      "Channel": "TPP",
      "Description": "Transaction description",
      "ExternalUniqueId": "",
      "Location": "APIM",
      "ToWallet": {"WalletId": "66"}
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    // request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    var jsonResponse = convert.jsonDecode(reply);

    print('Peer to peer Transaction ID: $jsonResponse.');
    setState(() {
      nedBankResponse = reply;
    });
    //print('Create wallet results : $reply');
  }

  getSecondToken() async {
    Map<String, String> mainheader = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nboauth/oauth20/token';
    var response = await http.post(
      url,
      headers: mainheader,
      body: {
        'client_id': '1ec68e41-ffce-4309-9c44-eb6f5196dc8e',
        'client_secret': 'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX',
        'grant_type': 'client_credentials',
        'scope': 'tpp_client_credential'
      },
    );
    var jsonResponse = convert.jsonDecode(response.body);
    token2 = jsonResponse['access_token'];
  }

  String token2;
  getWalletDetails() async {
    Map<String, String> mainheader = {
      "Content-Type": "Application/json",
      //"x-fapi-financial-id":"OB/2017/001",
      "Authorization": "Bearer " + token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/265993';
    var response = await http.get(
      url,
      headers: mainheader,
    );
    // print('Response status: ${response.statusCode}');
    print('Your Wallet Details is: ${response.body}');
  }

  eft() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/efts-out';
    //  https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/<WALLET_ID>/efts-out
    Map jsonData = {
      "RecipientReference": "2c0836d3-e51d-000",
      "OwnReference": "286b6df-8ffc-4086-82d7",
      "ExternalUniqueId": "90-9999-4321-772b-a091db120000",
      "amount": 70
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    // request.headers.set('x-fapi-financial-id', 'OB/2017/001');
    request.headers.set('Authorization', _token);
    request.headers
        .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
    request.headers.set('x-ibm-client-secret',
        'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
    request.add(utf8.encode(json.encode(jsonData)));
    HttpClientResponse response = await request.close();
    // await utf8.decoder.bind(response).forEach(print);
    String reply = await utf8.decoder.bind(response).join();
    httpClient.close();
    var jsonResponse = convert.jsonDecode(reply);

    print('EFT transactionID : $jsonResponse.');
    setState(() {
      nedBankResponse = reply;
    });
    //print('Create wallet results : $reply');
  }

 atm() async {
   var url =
       'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/atm-withdrawals';
   //  https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/<WALLET_ID>/efts-out
   Map jsonData = {
     "ExternalUniqueId": "5adde3f1-5de6-465f-a211-a091db0be086",
     "Amount": 70
   };
   var _token = 'Bearer $token';
   HttpClient httpClient = new HttpClient();
   HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
   request.headers.set('content-type', 'application/json');
   // request.headers.set('x-fapi-financial-id', 'OB/2017/001');
   request.headers.set('Authorization', _token);
   request.headers
       .set('x-ibm-client-id', '1ec68e41-ffce-4309-9c44-eb6f5196dc8e');
   request.headers.set('x-ibm-client-secret',
       'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX');
   request.add(utf8.encode(json.encode(jsonData)));
   HttpClientResponse response = await request.close();
   // await utf8.decoder.bind(response).forEach(print);
   String reply = await utf8.decoder.bind(response).join();
   httpClient.close();
   var jsonResponse = convert.jsonDecode(reply);

   print('ATM transactionID : $jsonResponse.');
   setState(() {
     nedBankResponse = reply;
   });
   //print('Create wallet results : $reply');
 }

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
                      controller.loadUrl(heavytokenLink);
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
                          print('Nxt Line of code');
                          await getHeavyToken();

                          if (transferType == "eft") {
                            await eft();
                          } else {
                            await atm();
                          }
                          Navigator.pop(context);
                          setState(() {
                            loadingPage = false;
                          });
                          DatabaseServices _db = DatabaseServices();
                          String month = DateTime.now().month.toString();
                          String day = DateTime.now().day.toString();

                          if (DateTime.now().month < 10) {
                            month = "0" + DateTime.now().month.toString();
                          }
                          if (DateTime.now().day < 10) {
                            day = "0" + DateTime.now().day.toString();
                          }
                          String today = DateTime.now().year.toString() +
                              "-" +
                              month +
                              "-" +
                              day;
                          await _db.addhistory(
                              loggedInUser,
                              "+" + "ATM / 3rd Party ",
                              payAmountContr.text,
                              "ATM Withdrawal",
                              "Withdrawal",
                              today);
                          showNotification();
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => SendMoneyScreen3(
                                  payAmountContr.text, cellNumber.substring(2)  )));
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

  String heavytokenLink ;

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(0, 'MBECHE WITHDRAWAL',
        'Your Withdraw transaction is complete ', platform,
        payload: 'Mbeche Transaction ');
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return NewScreen(
        payload: payload,
      );
    }));
  }

  Widget build(BuildContext context) {
    return loadingPage
        ? LoadingPage()
        : SendMoneyWidget(
            title: "EFT/ATM Withdrawal",
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
                  child: Image.asset('assets/Icon/withdraw.png',
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
                SizedBox(height: 20),
                Text(
                    "Withdrawals are free in all partaking retailers and 3rd parties. You get 1 free Nedbank withdrawal per month.",
                    style: poppinsRegular.copyWith(
                        color: ColorResources.COLOR_DIM_GRAY)),
                SizedBox(height: 6),
              /*  Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE),
                  child: CustomButton(
                      btnTxt: "Send As EFT",
                      onTap: () async {

                        if (payAmountContr.text.length < 2) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  MessageDialog("Please provide valid amount"));
                        } else {
                          setState(() {
                            loadingPage = true;
                            transferType = "eft";
                          });
                          await getToken();

                        }


                      }),
                ),
                SizedBox(height: 10),*/
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE),
                  child: CustomButton(
                      btnTxt: "Send as ATM Withdrawal",
                      onTap: () async {

                        if (payAmountContr.text.length < 2) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  MessageDialog("Please provide valid amount"));
                        } else {
                          setState(() {
                            loadingPage = true;
                            transferType = "atm";
                          });
                          await getToken();

                        }


                      }),
                ),

              ],
            ));
  }
}

import 'dart:io';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/pay_fast_screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';
import 'package:wallet_ui_kit/view/widgets/send_money_widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  final _phoneContr = TextEditingController();
  final _amountContr = TextEditingController();
  String _validError = "";
  String token;
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
    var jsonResponse = convert.jsonDecode(response.body);
    token = jsonResponse['access_token'];
    print('Response body: ${response.body}');
    getIntent();
  }

  getIntent() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/personal-loan-requests';
    Map jsonData = {
      "Data": {
        "Permissions": [
          "ReadPersonalLoanOffers",
          "ReadSalaryInformation",
          "SubmitPersonalLoanAcceptance"
        ],
        "ExpirationDateTime": "2028-10-05T11:53:47.909Z",
        "LoanAmount": "1000"
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
    /* var subscriptionId = jsonResponse['Data']['subscription_id'];
    subId = subscriptionId;
    print('subscription_id is: $subscriptionId');*/
    //  getHeavyToken();
  }

  getHeavyToken() async {
    setState(() {
      loadingPage = false;
    });
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
        'grant_type': 'authorization_code',
        'code': "VI0dIgfJfGJTP5coHugPWZjWAxZ1yA",
        'redirect_uri': 'http://www.ankhnegus.africa'
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
     var jsonResponse = convert.jsonDecode(response.body);
    token = jsonResponse['access_token'];
     getLoansOffers();
  }

  getLoansOffers() async {
    Map<String, String> mainheader = {
      "Content-Type": "Application/json",
      "x-fapi-financial-id":"OB/2017/001",
      "Authorization": token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
          "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/open-banking/v1/personal-loan-offers?loanAmount=1000';
    var response = await http.get(
      url,
      headers: mainheader,
    );
    print('Response status: ${response.statusCode}');
    print('Terms and conditions: ${response.body}');
    /* if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }*/
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/bg2.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: loadingPage
                ? LoadingPage()
                : Column(
                    children: [
                      CustomAppBar(title: "Airtime"),
                      Expanded(
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Container(
                              width: double.infinity,
                              height: 170,
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/Illustration/topup-pg.png',
                                width: 153,
                                height: 153,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              height: 44,
                              margin: EdgeInsets.only(right: 20, left: 20),
                              padding: EdgeInsets.only(left: 20, right: 20),
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20, left: 20),
                              padding: EdgeInsets.only(left: 20, right: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(23),
                                          color: ColorResources
                                              .COLOR_PRIMARY_DARK),
                                      child: Text(Strings.AMOUNT,
                                          style: poppinsRegular.copyWith(
                                              color:
                                                  ColorResources.COLOR_WHITE)),
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
                            /* Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20, bottom: 30),
                        child: Text(
                          Strings.AVAIBLE_BALANCE,
                          style: montserratSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL),
                        ),
                      ),*/

                            SizedBox(height: 6),
                            Container(
                                margin: EdgeInsets.only(right: 50, left: 50),
                                child: CustomButton(
                                  btnTxt: Strings.CONTINUE,
                                  onTap: () async {
                                    setState(() {
                                      loadingPage = true;
                                    });
                                   // getToken();
                                      bool valid = true;
                                    if (_amountContr.text.length < 2) {
                                      setState(() {
                                        valid = false;
                                        _validError =
                                            "Please make sure you have entered a valid amount";
                                      });
                                    }

                                    if (_phoneContr.text.length < 9 ||
                                        _phoneContr.text.length > 9) {
                                      setState(() {
                                        valid = false;
                                        _validError =
                                            "Please make sure you have entered a valid Phone Number";
                                      });
                                    }
                                    if (valid == true) {
                                      var response = await accessToken();
                                      print(response.body);
                                      var jsonResponse =
                                          convert.jsonDecode(response.body);
                                      String token =
                                          jsonResponse['access_token'];
                                      var headers = {
                                        'Accept':
                                            'application/com.reloadly.topups-v1+json',
                                        'Authorization': 'Bearer $token'
                                      };
                                      var request = http.Request(
                                          'GET',
                                          Uri.parse(
                                              'https://topups.reloadly.com/accounts/balance'));

                                      request.headers.addAll(headers);

                                      http.StreamedResponse response1 =
                                          await request.send();

                                      if (response.statusCode == 200) {
                                        print(await response1.stream
                                            .bytesToString());
                                      } else {
                                        print(response.reasonPhrase);
                                      }
                                      String oparetor = await getOparetor(
                                          "+27" + _phoneContr.text, token);
                                      print(oparetor);
                                      var oparetorResponse =
                                          convert.jsonDecode(oparetor);
                                      //  int oparetorID =
                                      //  int.parse(oparetorResponse['id']);
                                      // print(oparetorResponse['id']);
                                      String topUp = await TopUp(
                                          token,
                                          oparetorResponse['id'],
                                          // oparetorID,
                                          int.parse(_amountContr.text),
                                          "+27748248292",
                                          "+27" + _phoneContr.text);
                                      print(topUp);
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MessageDialog(topUp));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MessageDialog(_validError));
                                    }
                                    setState(() {
                                      loadingPage = false;
                                    });
                                  },
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 50, left: 50),
                                child: CustomButton(
                                  btnTxt: "Check Agent Balance",
                                  onTap: () async {
                                    setState(() {
                                      loadingPage = true;
                                    });
                                       var response = await accessToken();
                                    print(response.body);
                                    var jsonResponse =
                                        convert.jsonDecode(response.body);
                                    String token = jsonResponse['access_token'];
                                    var headers = {
                                      'Accept':
                                          'application/com.reloadly.topups-v1+json',
                                      'Authorization': 'Bearer $token'
                                    };
                                    var request = http.Request(
                                        'GET',
                                        Uri.parse(
                                            'https://topups.reloadly.com/accounts/balance'));

                                    request.headers.addAll(headers);

                                    http.StreamedResponse response1 =
                                        await request.send();

                                    if (response.statusCode == 200) {
                                      String res = await response1.stream
                                          .bytesToString();
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              MessageDialog(res));
                                    } else {
                                      print(response.reasonPhrase);
                                    }
                               //     getHeavyToken();
                                    setState(() {
                                      loadingPage = false;
                                    });
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

Future<http.Response> accessToken() {
  return http.post(
    'https://auth.reloadly.com/oauth/token',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, String>{
        'audience': 'https://topups.reloadly.com',
        'client_id': 'dnTXvsYzt4A0Jv3z13HdwdVcryCtoMUY',
        'client_secret':
            'OHXxPqQSQb-2ntUDK0pUe9wQ2ytKCL-u1hqBpNryGaBluJJH8RazNxflOFNroNh',
        'grant_type': 'client_credentials'
      },
    ),
    //encoding: Encoding.getByName('utf-8')
  );
}

Future<http.Response> getBalance(String access_code) {
  Map<String, String> mainheader = {
    "Accept": "application/com.reloadly.topups-v1+json",
    "Authorization": "Bearer $access_code",
  };
  print(access_code);
  return http.get(
    "https://topups.reloadly.com/accounts/balance",
    headers: mainheader,
  );
  print(access_code);
}

Future<String> getOparetor(String phoneNumber, String accessToken) async {
  var headers = {'Authorization': 'Bearer $accessToken'};
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://topups.reloadly.com/operators/auto-detect/phone/$phoneNumber/countries/ZA?&includeBundles=true'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    return await response.stream.bytesToString();
  } else {
    print(response.reasonPhrase);
    return response.reasonPhrase;
  }
}

Future<String> TopUp(String token, int operatorID, int amount, String sender,
    String receiver) async {
  var headers = {
    'Authorization': 'Bearer $token',
    'Content-Type': 'application/json; charset=UTF-8'
  };
  var request =
      http.Request('POST', Uri.parse('https://topups.reloadly.com/topups'));
  request.body =
      '''{\n\t"operatorId":"$operatorID",\n\t"amount":"$amount",\n\t"useLocalAmount": false,\n\t"customIdentifier": "James Leeroy",\n\t"recipientPhone": {\n\t\t"countryCode": "ZA",\n\t\t"number": "$receiver"\n\t},\n\t"senderPhone": {\n\t\t"countryCode": "ZA",\n\t\t"number": "$sender"\n\t}\n}''';
  request.headers.addAll(headers);
//print(token +" $operatorID");
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return await response.stream.bytesToString();
  } else {
    return response.stream.bytesToString();
  }
}

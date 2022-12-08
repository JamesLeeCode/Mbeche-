import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/provider/goals_provider.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/add_money_in_wallet.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/my_goals_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';

import 'dart:io';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wallet_ui_kit/view/screens/withdrawal_screen.dart';

class SavingAccountScreen extends StatefulWidget {
  @override
  _SavingAccountScreenState createState() => _SavingAccountScreenState();
}

class _SavingAccountScreenState extends State<SavingAccountScreen> {
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
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      token = jsonResponse['access_token'];
      print('Token is: $token.');
      await changePin();

      //await getWalletDetails();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  changePin() async {
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/wallets/55/pin-changes';
    Map jsonData = {
      "Data": {
        "IdentityNumber": "7803014567893"
      }
    };
    var _token = 'Bearer $token';
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
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



  }


  int bannerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingPage
          ? LoadingPage()
          :  Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/transfer.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                    title: "My Wallet", color: ColorResources.COLOR_WHITE),
                Expanded(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        padding: EdgeInsets.only(left: 15, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: ColorResources.COLOR_WHITE.withOpacity(.24)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Strings.BALANCE,
                                style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_WHITE)),
                            Text(Strings.DOLLER6500,
                                style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_WHITE)),
                            Icon(Icons.arrow_forward,
                                size: 20, color: ColorResources.COLOR_WHITE)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          Strings.ACCOUNT_DETAILS25214,
                          style: montserratSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: ColorResources.COLOR_SILVER),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Strings.INTEREST_RATE,
                                    style: montserratSemiBold.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.COLOR_SILVER),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Strings.PERSENT6,
                                        style: poppinsSemiBold.copyWith(
                                            color: ColorResources.COLOR_WHITE),
                                      ),
                                      Text(
                                        Strings.SLASHYEAR,
                                        style: montserratSemiBold.copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_SMALL,
                                            color: ColorResources.COLOR_SILVER),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    Strings.YOUR_INTEREST,
                                    style: montserratSemiBold.copyWith(
                                        fontSize: Dimensions.FONT_SIZE_SMALL,
                                        color: ColorResources.COLOR_SILVER),
                                  ),
                                  Text(Strings.DOLLER180,
                                      style: poppinsSemiBold.copyWith(
                                          color: ColorResources.COLOR_WHITE)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        margin: EdgeInsets.only(left: 18, right: 18),
                        height: 88,
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                  child: IconTitleButton(
                                      iconUrl: 'assets/Icon/add money.png',
                                      title: Strings.ADD_MONEY),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddMoneyInWallet()));
                                  }),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: GestureDetector(
                                child: IconTitleButton(
                                    iconUrl: 'assets/Icon/withdraw.png',
                                    title: Strings.WITHDRAW),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Withdrawal()));
                                },
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                                child: GestureDetector(
                              child: IconTitleButton(
                                  iconUrl: 'assets/Icon/topup.png',
                                  title: "Transfer Funds"),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SendMoneyScreen1()));
                              },
                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          margin: EdgeInsets.only(right: 50, left: 50),
                          child: CustomButton(
                            btnTxt: "Change Account Pin",
                            onTap: () async {
                              setState(() {
                                loadingPage = true;
                              });
                             await getToken();
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        MessageDialog("A Link to reset your account will be send to email. "));
                                loadingPage = false;
                              });

                            },
                          )),
                      SizedBox(height: 10),
                      Container(
                          margin: EdgeInsets.only(right: 50, left: 50),
                          child: CustomButton(
                            btnTxt: "Wallet Terms And Conditions ",
                            onTap: () async {},
                          )),
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Our Services",
                          style: poppinsSemiBold.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15),
                      Stack(children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_LARGE),
                          height: 90,
                          width: double.infinity,
                          child: CarouselSlider.builder(
                            itemCount: Provider.of<GoalsProvider>(context)
                                .getGoalsList()
                                .length,
                            itemBuilder: (context, index) => MyGoalsCardWidget(
                                Provider.of<GoalsProvider>(context)
                                    .getGoalsList()[index]),
                            options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 2,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              initialPage: 0,
                              viewportFraction: 1.0,
                              onPageChanged: (int index, reason) {
                                setState(() {
                                  bannerIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          left: 0,
                          right: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _indicator()),
                        ),
                      ]),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Mbeche Mobile Money Transfer",
                                style: poppinsSemiBold.copyWith(
                                    color: ColorResources.COLOR_CHARCOAL)),
                            Stack(
                              overflow: Overflow.visible,
                              children: [
                                /*   Image.asset('assets/images/person2.png',
                                    width: 30, height: 30),
                                Positioned(
                                  right: 20,
                                  child: Image.asset(
                                      'assets/images/person1.png',
                                      width: 30,
                                      height: 30),
                                ),
                                Positioned(
                                  right: 40,
                                  child: Image.asset(
                                      'assets/images/person3.png',
                                      width: 30,
                                      height: 30),
                                ),*/
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Wallet powered by NEDBANK",
                          style: montserratSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: ColorResources.COLOR_DIM_GRAY),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Discover a new way, secure, convenient way to visualise and manage your money on the go. ",
                          style: montserratSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: ColorResources.COLOR_DIM_GRAY),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorResources.COLOR_WHITE),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: ColorResources.COLOR_PRIMARY_DARK),
                                child: Text(Strings.DOLLER_126,
                                    style: poppinsRegular.copyWith(
                                        color: ColorResources.COLOR_WHITE)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 20),
                                alignment: Alignment.center,
                                child: Text(
                                  Strings.DOLLER_49,
                                  style: poppinsRegular.copyWith(
                                      color: ColorResources.COLOR_ROYAL_BLUE),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _indicator() {
    List<Widget> indicator = [];
    for (int i = 0;
        i < Provider.of<GoalsProvider>(context).getGoalsList().length;
        i++) {
      indicator.add(TabPageSelectorIndicator(
        backgroundColor:
            i == bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        borderColor:
            i == bannerIndex ? Colors.orange : ColorResources.COLOR_WHITE,
        size: 8,
      ));
    }
    return indicator;
  }
}

class IconTitleButton extends StatelessWidget {
  final String iconUrl;
  final String title;
  IconTitleButton({@required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconUrl, width: 35, height: 25),
          SizedBox(height: 10),
          Text(title,
              style: poppinsRegular.copyWith(
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                  color: ColorResources.COLOR_DIM_GRAY)),
        ],
      ),
    );
  }
}

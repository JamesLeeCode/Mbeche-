import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/cashFlow_Screen.dart';
import 'package:wallet_ui_kit/view/screens/chatbot_screen.dart';
import 'package:wallet_ui_kit/view/screens/investment_screen.dart';
import 'package:wallet_ui_kit/view/screens/loan_screen.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';

import 'insurance_screen.dart';

class InsightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
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
                  CustomAppBar1(
                      title: Strings.INSIGHT,
                      color: ColorResources.COLOR_WHITE),
                  Expanded(
                    child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 350,
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: ColorResources.COLOR_WHITE,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 87, right: 87, top: 23),
                                      alignment: Alignment.center,
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            height: 130,
                                            width: 130,
                                            child: CircularProgressIndicator(
                                              value: .8,
                                              strokeWidth: 5,
                                              backgroundColor: ColorResources
                                                  .COLOR_WHITE_SMOKE,
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                          Color>(
                                                      ColorResources
                                                          .COLOR_SHAMROCK),
                                            ),
                                          ),
                                          Container(
                                            width: 130,
                                            height: 130,
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  ColorResources.COLOR_SHAMROCK,
                                              radius: 55,
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      Strings.NUMBER80,
                                                      style: poppinsRegular
                                                          .copyWith(
                                                              fontSize: 42,
                                                              color: ColorResources
                                                                  .COLOR_WHITE),
                                                    ),
                                                    Text(
                                                      Strings.GOOD,
                                                      style: poppinsRegular.copyWith(
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_SMALL,
                                                          color: ColorResources
                                                              .COLOR_WHITE),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      Strings.GOOD_HEALTH,
                                      style: poppinsSemiBold.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_LARGE,
                                          color: ColorResources.COLOR_CHARCOAL),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      Strings.YOUR_FINANCIAL_CONDITION,
                                      style: montserratSemiBold.copyWith(
                                          fontSize: Dimensions.FONT_SIZE_SMALL,
                                          color: ColorResources.COLOR_DIM_GRAY),
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      height: 2,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensions.PADDING_SIZE_DEFAULT),
                                      color:
                                          ColorResources.COLOR_VERY_LIGHT_GRAY,
                                    ),
                                    SizedBox(height: 15),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              Dimensions.PADDING_SIZE_DEFAULT),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          CashFlowScreen()));
                                            },
                                            child: IconTitleButton(
                                                iconUrl:
                                                    'assets/Icon/cashflow.png',
                                                title: Strings.CASH_FLOW),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          LoanScreen()));
                                            },
                                            child: IconTitleButton(
                                                iconUrl: 'assets/Icon/loan.png',
                                                title: Strings.LOAN),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          InsuranceScreen()));
                                            },
                                            child: IconTitleButton(
                                                iconUrl:
                                                    'assets/Icon/insurance.png',
                                                title: Strings.INSURANCE),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ChatbotScreen()));
                                            },
                                            child: IconTitleButton(
                                                iconUrl:
                                                    'assets/Icon/investment.png',
                                                title: "Chatbot"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /* Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(Strings.MEETMRNIPPON, style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_CHARCOAL)),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                          itemCount: 10,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                padding: EdgeInsets.only(left: 17, bottom: 6, top: 23, right: 10),
                                decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 46,
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset('assets/images/person1.png', width: 46, height: 46),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        children: [
                                          Text(
                                            Strings.LOREM__ALIQUA,
                                            style:
                                                montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                Strings.ASK_MORE,
                                                style: poppinsSemiBold.copyWith(
                                                    fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_ROYAL_BLUE),
                                              ),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.chevron_right, color: ColorResources.COLOR_PRIMARY_DARK),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),*/
                            ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconTitleButton extends StatelessWidget {
  final String iconUrl;
  final String title;

  IconTitleButton({@required this.iconUrl, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(iconUrl, width: 52, height: 52, fit: BoxFit.scaleDown),
        SizedBox(height: 7),
        Text(title,
            style: poppinsRegular.copyWith(
                color: ColorResources.COLOR_DIM_GRAY,
                fontSize: Dimensions.FONT_SIZE_SMALL)),
      ],
    );
  }
}

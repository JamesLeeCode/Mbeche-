import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallet_ui_kit/data/repository/loan_data.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/loan_card_widget.dart';

class LoanScreen extends StatefulWidget {
  @override
  _LoanScreenState createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      CustomAppBar(title: Strings.LOAN),
      Expanded(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            height: 10,
            color: ColorResources.COLOR_BACKGROUND,
          ),
          Container(
            height: 430,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, top: 18, right: 30, bottom: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.TOTAL_LOAN,
                        style: poppinsSemiBold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        Strings.DOLLER_3663,
                        style: poppinsSemiBold.copyWith(
                          color: ColorResources.COLOR_PRIMARY_DARK,
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_NEON_CARROT),
                                child: Text(
                                  Strings.BUSINESS,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: ColorResources.COLOR_WHITE,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  Strings.USD3000,
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_MAYA_BLUE),
                                child: Text(
                                  Strings.EDUCATION,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: ColorResources.COLOR_WHITE,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  Strings.USD700,
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WILD_WATERMELON),
                                child: Text(
                                  Strings.PERSONAL,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: ColorResources.COLOR_WHITE,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  Strings.USD375,
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Container(
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_WHITE_SMOKE),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_DARK_ORCHID),
                                child: Text(
                                  Strings.VAHICLE,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                    color: ColorResources.COLOR_WHITE,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(left: 20, right: 15),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  Strings.USD4100,
                                  textAlign: TextAlign.center,
                                  style: poppinsRegular.copyWith(
                                    fontSize: Dimensions.FONT_SIZE_SMALL,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: ColorResources.COLOR_VERY_LIGHT_GRAY,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 15, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.HOUSE_LOAN,
                            style: poppinsSemiBold,
                          ),
                          Text(
                            "You are up to date with your house loan",
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 22,
                        height: 22,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorResources.COLOR_SHAMROCK,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Icon(
                          Icons.done,
                          size: 15,
                          color: ColorResources.COLOR_SHAMROCK,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: ColorResources.COLOR_VERY_LIGHT_GRAY,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30, top: 13, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.UTILITY,
                            style: poppinsSemiBold,
                          ),
                          Text(
                            "There is some outstanding funds with your utility loan",
                            style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                            ),
                          )
                        ],
                      ),
                      Icon(
                        Icons.error_outline,
                        size: 25,
                        color: ColorResources.COLOR_ALIZARIN,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ), // for 1st card
          Container(
            width: double.infinity,
            height: 10,
            color: ColorResources.COLOR_BACKGROUND,
          ), // for background
          Container(
            height: 185,
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 30, top: 18, right: 30, bottom: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.BUY_LOAN,
                    style: poppinsSemiBold,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/Icon/transport.png',
                              width: 52,
                              height: 52,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              Strings.HOME,
                              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/Icon/health 2.png',
                              width: 52,
                              height: 52,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              Strings.HEALTH,
                              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/Icon/transport 2.png',
                              width: 52,
                              height: 52,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              Strings.VAHICLE,
                              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/Icon/education2.png',
                              width: 52,
                              height: 52,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              Strings.EDUCATION,
                              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: ColorResources.COLOR_DARK_ORCHID,
                    ),
                  )
                ],
              ),
            ),
          ), // for 2nd card
          Container(
            width: double.infinity,
            height: 10,
            color: ColorResources.COLOR_BACKGROUND,
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 9),
            child: ListView.builder(
                itemCount: LoanData.getAllLoanData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return LoanCardWidget(LoanData.getAllLoanData[index]);
                }),
          ),
          Container(
            width: double.infinity,
            height: 10,
            color: ColorResources.COLOR_BACKGROUND,
          ),
        ],
      )),
    ])));
  }
}

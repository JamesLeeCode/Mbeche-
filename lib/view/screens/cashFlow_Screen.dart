import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';

class CashFlowScreen extends StatefulWidget {
  @override
  _CashFlowScreenState createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: Strings.CASH_FLOW),
            Expanded(
              child: ListView(physics: BouncingScrollPhysics(), children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  color: ColorResources.COLOR_BACKGROUND,
                ),
                Container(
                  height: 240,
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
                              Strings.JANUARY_SAVING,
                              style: poppinsRegular,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              Strings.USD266,
                              style: poppinsSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE, color: ColorResources.COLOR_PRIMARY_DARK),
                            ),
                            SizedBox(
                              height: 10,
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
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_PRIMARY_DARK),
                                      child: Text(
                                        Strings.EARNED,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        Strings.USD26,
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
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_DARK_ORCHID),
                                      child: Text(
                                        Strings.SPENT,
                                        style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_SMALL),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        Strings.USD375,
                                        textAlign: TextAlign.center,
                                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL),
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
                                  Strings.JANUARY_SAVING,
                                  style: poppinsRegular,
                                ),
                                Text(
                                  "You are up to date with your January savings",
                                  style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
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
                      )
                    ],
                  ),
                ), // for 1st card
                Container(
                  width: double.infinity,
                  height: 10,
                  color: ColorResources.COLOR_BACKGROUND,
                ), // for background
                Container(
                  height: 240,
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
                              Strings.JANUARY_SAVING,
                              style: poppinsRegular,
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
                                        Strings.TRANSPORT,
                                        style: poppinsRegular.copyWith(
                                          fontSize: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/Icon/food.png',
                                        width: 52,
                                        height: 52,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Strings.FOOD,
                                        style: poppinsRegular.copyWith(
                                          fontSize: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/Icon/utility.png',
                                        width: 52,
                                        height: 52,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Strings.UTILITY,
                                        style: poppinsRegular.copyWith(
                                          fontSize: 11,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'assets/Icon/rent.png',
                                        width: 52,
                                        height: 52,
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        Strings.RENT,
                                        style: poppinsRegular.copyWith(
                                          fontSize: 11,
                                        ),
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
                                  style: poppinsRegular,
                                ),
                                Text(
                                  "There is some outstanding funds with your utility saving for January",
                                  style: poppinsRegular.copyWith(
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.error_outline,
                              size: 25,
                              color: ColorResources.COLOR_WILD_WATERMELON,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ), // for 2nd card
                Container(
                  width: double.infinity,
                  height: 10,
                  color: ColorResources.COLOR_BACKGROUND,
                ), // for background
                Container(
                  height: 260,
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
                              Strings.MONTHLY_BUDGET,
                              style: poppinsRegular,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/Icon/transport.png',
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.TRANSPORT,
                                      style: poppinsRegular,
                                    ),
                                    Text(
                                      Strings.USD69_MONTH,
                                      style: poppinsRegular.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_PRIMARY_DARK),
                                      child: Text(
                                        Strings.USD426,
                                        style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_WHITE),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        Strings.USD1000,
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
                                  Strings.TRANSPORTATION,
                                  style: poppinsRegular,
                                ),
                                Text(
                                  "You are up to date with your transportation saving",
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
                      )
                    ],
                  ),
                ), // for 3rd card
                Container(
                  width: double.infinity,
                  height: 10,
                  color: ColorResources.COLOR_BACKGROUND,
                ),
              ]),
            ), // for background
          ],
        ),
      ),
    );
  }
}

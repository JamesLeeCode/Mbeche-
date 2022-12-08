import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/daily_chart_widget.dart';

class InvestMentScreen extends StatefulWidget {
  @override
  _InvestMentScreenState createState() => _InvestMentScreenState();
}

class _InvestMentScreenState extends State<InvestMentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      CustomAppBar(title: Strings.INVESTMENT),
      Expanded(
          child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 376,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
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
                        Strings.TOTAL_PORTFOLIO,
                        style: montserratSemiBold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.DOLLER_3663,
                            style: montserratSemiBold.copyWith(
                              fontSize: Dimensions.FONT_SIZE_LARGE,
                              color: ColorResources.COLOR_ROYAL_BLUE,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: ColorResources.COLOR_PRIMARY_DARK,
                            radius: 13,
                            child: Icon(
                              Icons.add,
                              color: ColorResources.COLOR_WHITE,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(height: 165, width: MediaQuery.of(context).size.width, child: DailyChartWidget()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      Strings.DAY,
                      style: poppinsRegular.copyWith(fontSize: 11),
                    ),
                    Text(
                      Strings.WEEK,
                      style: poppinsRegular.copyWith(fontSize: 11),
                    ),
                    Text(
                      Strings.MONTH,
                      style: poppinsRegular.copyWith(fontSize: 11),
                    ),
                    Text(
                      Strings.YEAR,
                      style: poppinsRegular.copyWith(fontSize: 11),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
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
                            Strings.INVESTMENT,
                            style: poppinsSemiBold,
                          ),
                          Text(
                            Strings.LOREM__CONSECTETUR1,
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
            height: 370,
            margin: EdgeInsets.only(
              top: Dimensions.FONT_SIZE_EXTRA_SMALL,
              bottom: Dimensions.FONT_SIZE_EXTRA_SMALL,
            ),
            decoration: BoxDecoration(
              color: ColorResources.COLOR_WHITE,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
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
                        Strings.MY_PORTFOLIO,
                        style: poppinsSemiBold,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_SHAMROCK,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.ANTM,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.NUMBER589,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.SHARES162,
                                      style: poppinsRegular.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          color: ColorResources.COLOR_SHAMROCK,
                                          size: 20,
                                        ),
                                        Text(
                                          Strings.PERCENT4,
                                          style: poppinsRegular.copyWith(fontSize: 11),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 30,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 0),
                                        child: _myPortfolioChartWidget(context)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_SHAMROCK,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.TLPD,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.NUMBER694,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.SHARES361,
                                      style: poppinsRegular.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ColorResources.COLOR_MEDIUM_VIOLET_RED,
                                          size: 20,
                                        ),
                                        Text(
                                          Strings.PERCENT3,
                                          style: poppinsRegular.copyWith(fontSize: 11),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 30,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 0),
                                        child: _myPortfolioChartWidget(context)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_SHAMROCK,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.ANTM,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.NUMBER589,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.SHARES162,
                                      style: poppinsRegular.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_up,
                                          color: ColorResources.COLOR_SHAMROCK,
                                          size: 20,
                                        ),
                                        Text(
                                          Strings.PERCENT4,
                                          style: poppinsRegular.copyWith(fontSize: 11),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 30,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 0),
                                        child: _myPortfolioChartWidget(context)),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 3,
                                  backgroundColor: ColorResources.COLOR_SHAMROCK,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Strings.TLPD,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.NUMBER694,
                                      style: poppinsSemiBold,
                                    ),
                                    Text(
                                      Strings.SHARES361,
                                      style: poppinsRegular.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: ColorResources.COLOR_MEDIUM_VIOLET_RED,
                                          size: 20,
                                        ),
                                        Text(
                                          Strings.PERCENT3,
                                          style: poppinsRegular.copyWith(fontSize: 11),
                                        )
                                      ],
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: 30,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(right: 0),
                                        child: _myPortfolioChartWidget(context)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ), // for 2nd card
          Container(
            width: double.infinity,
            height: 10,
            color: ColorResources.COLOR_BACKGROUND,
          ),
        ],
      )),
    ])));
  }

  Widget _myPortfolioChartWidget(BuildContext context) {
    return BezierChart(
      bezierChartScale: BezierChartScale.CUSTOM,
      xAxisCustomValues: const [0, 1, 2, 3, 4, 5],
      series: const [
        BezierLine(
          lineColor: ColorResources.COLOR_DARK_ORCHID,
          lineStrokeWidth: 2,
          dataPointFillColor: Colors.transparent,
          dataPointStrokeColor: Colors.transparent,
          data: const [
            DataPoint<double>(
              value: 0,
            ),
            DataPoint<double>(
              value: 50,
            ),
            DataPoint<double>(
              value: 0,
            ),
            DataPoint<double>(
              value: 100,
            ),
            DataPoint<double>(
              value: 70,
            ),
            DataPoint<double>(
              value: 80,
            ),
          ],
        ),
      ],
      config: BezierChartConfig(
        verticalIndicatorStrokeWidth: 2.0,
        verticalIndicatorColor: Colors.black12,
        showVerticalIndicator: true,
        contentWidth: 90,
      ),
    );
  }
}

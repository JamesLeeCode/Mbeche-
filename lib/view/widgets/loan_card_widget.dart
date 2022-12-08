import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/loan_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class LoanCardWidget extends StatelessWidget {
  final LoanModel loan;

  LoanCardWidget(this.loan);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 200,
      margin: EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
        color: ColorResources.COLOR_WHITE,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 12, right: 11, bottom: 17, top: 18),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/wallet/Icon/transport 2.png',
                width: 32,
                height: 32,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                loan.title,
                style: poppinsSemiBold,
              )
            ],
          ),
          SizedBox(
            height: 12,
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), color: ColorResources.COLOR_MEDIUM_VIOLET_RED),
                    child: Text(
                      Strings.TOTAL,
                      style: poppinsRegular.copyWith(
                        color: ColorResources.COLOR_WHITE,
                        fontSize: Dimensions.FONT_SIZE_SMALL,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    alignment: Alignment.centerRight,
                    child: Text(
                      loan.totalUsd,
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
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.UPCOMING_PAYMENT,
                    style: poppinsRegular.copyWith(
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    loan.date,
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                    ),
                  ),
                ],
              ),
              Text(
                loan.upcomingPaymentUsd,
                style: poppinsRegular.copyWith(fontSize: 11, color: ColorResources.COLOR_DARK_ORCHID),
              )
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            height: Dimensions.MAKE_PAYMENT_BTN_HEIGHT30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  ColorResources.COLOR_ROYAL_BLUE,
                  ColorResources.COLOR_ROYAL_BLUE,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: FlatButton(
              child: Text(
                Strings.MAKE_PAYMENT,
                style: poppinsRegular.copyWith(
                  color: ColorResources.COLOR_WHITE,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                ),
              ),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}

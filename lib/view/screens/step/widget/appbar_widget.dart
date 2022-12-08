import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class AppbarWidget extends PreferredSize {
  final String appBarTitle;
  AppbarWidget({this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.chevron_left,
              size: 30,
              color: ColorResources.COLOR_BLACK,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Center(
            child: Text(
              appBarTitle,
              textAlign: TextAlign.center,
              style: montserratSemiBold.copyWith(
                fontSize: Dimensions.FONT_SIZE_SMALL,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
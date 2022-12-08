import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String btnTxt;
  final bool isWhiteBackground;
  final double btnHeight;
  final bool isProduct;

  CustomButton({this.onTap, @required this.btnTxt, this.isWhiteBackground = false,this.btnHeight,this.isProduct=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight??45,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
          gradient: LinearGradient(colors: [
            ColorResources.COLOR_DARK_ORCHID,
            ColorResources.COLOR_ROYAL_BLUE,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),

          //color: isWhiteBackground ? ColorResources.COLOR_WHITE : ColorResources.COLOR_PRIMARY,
        borderRadius: BorderRadius.all(Radius.circular(50)),),
      child: FlatButton(
        onPressed: onTap,
        padding: EdgeInsets.all(0),
        child: Text(btnTxt,
            style: !isProduct?
            poppinsRegular.copyWith(
                color: isWhiteBackground ?
                ColorResources.COLOR_PRIMARY :
                ColorResources.COLOR_WHITE):
            poppinsRegular.copyWith(
                color: isWhiteBackground ?
                ColorResources.COLOR_PRIMARY :
                ColorResources.COLOR_WHITE,fontSize: 8)
        ),
      ),
    );
  }
}

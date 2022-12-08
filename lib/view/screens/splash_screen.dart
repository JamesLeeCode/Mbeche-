import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/view/screens/pixallet_onboarding_screen.dart';
import 'package:wallet_ui_kit/view/screens/topup_screen.dart';

class SplashScreenWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
               /* TopUpScreen */  PixalletOnBoardingScreen ())));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        /*child: GradientText(
          Strings.PIXALLET,
          gradient: LinearGradient(colors: [
            ColorResources.COLOR_ROYAL_BLUE,
            ColorResources.COLOR_ROYAL_BLUE,
            ColorResources.COLOR_DARK_ORCHID,
          ]),
          style: poppinsBold.copyWith(fontSize: 50),
        ),*/
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                /*boxShadow: [BoxShadow(color:Colors.pink,spreadRadius: 7 )],*/
                //shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/negus.gif"),
                    fit: BoxFit.fitWidth)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Color color;
  CustomAppBar({@required this.title, this.color = ColorResources.COLOR_GRAY});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        IconButton(
          icon: Icon(Icons.chevron_left, size: 25, color: color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        Center(
            child:
                Text(title, style: montserratSemiBold.copyWith(color: color))),
      ]),
    );
  }
}

class CustomAppBar1 extends StatelessWidget {
  final String title;
  final Color color;
  CustomAppBar1({@required this.title, this.color = ColorResources.COLOR_GRAY});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Center(
            child:
                Text(title, style: montserratSemiBold.copyWith(color: color))),
      ]),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/my_goals_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class MyGoalsCardWidget extends StatelessWidget {
  final MyGoalsModel myGoals;
  MyGoalsCardWidget(this.myGoals);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              myGoals.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 81,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  gradient: LinearGradient(colors: [
                    ColorResources.COLOR_BRIGHT_TURQUOISE,
                    ColorResources.COLOR_BRIGHT_TURQUOISE,
                    ColorResources.COLOR_DODGER_BLUE,
                  ])),
              child: Text(
                myGoals.goalTitle,
                style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE, fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL),
              ),
            ),
          )
        ],
      ),
    );
  }
}

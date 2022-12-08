import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/get_started_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class GetStatedCardWidget extends StatelessWidget {
  final GetStartedModel getStarted;
  final GetStartedModel getSecondData;
  final CarouselController carouselController;
  GetStatedCardWidget(
      this.getStarted, this.getSecondData, this.carouselController);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: Dimensions.FIRST_SLIDE_WEIGHT,
          height: Dimensions.FIRST_SLIDE_HEIGHT,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorResources.COLOR_WHITE,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(getStarted.imageUrl,
                  height: Dimensions.CARD_IMAGE_HEIGHT, fit: BoxFit.fill),
              SizedBox(height: 5),
              /*  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Expanded(
                    child: Text(getStarted.title,
                        style: poppinsRegular.copyWith(
                          color: ColorResources.COLOR_CHARCOAL,
                          fontSize: 18,
                        ))),
              ])*/
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
            flex: 4,
            child: Text(getSecondData.secondSlideText,
                textAlign: TextAlign.center,
                style: montserratSemiBold.copyWith(
                    fontSize: 12, color: Colors.white))),
      ],
    );
  }
}

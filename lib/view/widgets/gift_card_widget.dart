import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/gift_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/style.dart';

class GiftCardWidget extends StatelessWidget {
  final GiftModel gift;
  final bool isSelected;
  GiftCardWidget(this.gift, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 100,
            margin: EdgeInsets.only(top: 10),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(gift.imageUrl)),
                isSelected
                    ? Positioned(
                        right: -5,
                        top: -10,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: ColorResources.COLOR_SHAMROCK,
                          child: Icon(
                            Icons.done,
                            color: ColorResources.COLOR_WHITE,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Text(
              gift.title,
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_CHARCOAL),
            ),
          )
        ],
      ),
    );
  }
}

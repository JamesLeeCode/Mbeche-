import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/e_shopping_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';

class ProductWidget extends StatelessWidget {
  final EShoppingModel eshoppingModel;
  ProductWidget(this.eshoppingModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7, bottom: 9, top: 7),
      decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.favorite,
                color: ColorResources.COLOR_ROYAL_BLUE,
                size: 15,
              ),
              Icon(
                Icons.shop,
                color: ColorResources.COLOR_DARK_ORCHID,
                size: 15,
              ),
            ],
          ),
          Expanded(
            flex: 6,
            child: Image.asset(
              eshoppingModel.imageUrl,
              fit: BoxFit.scaleDown,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                eshoppingModel.productName,
                style: poppinsRegular,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                eshoppingModel.productPrice,
                style: poppinsSemiBold.copyWith(color: ColorResources.COLOR_PRIMARY_DARK,),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(5),
              child: CustomButton(
                btnTxt: Strings.BUY,
                btnHeight: 20,
                isProduct: true,
                onTap: (){},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

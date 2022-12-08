import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/provider/charity_provider.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/carity_card_widget.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class CharityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            CustomAppBar(title: Strings.CHARITY),
            SizedBox(height: 20),

            Text(
              Strings.LOREM__CONSECTETUR,
              textAlign: TextAlign.center,
              style: poppinsRegular.copyWith(fontSize: 18, color: ColorResources.COLOR_CHARCOAL),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 62, vertical: 10),
              child: Text(
                Strings.LOREM__TEMPOR,
                textAlign: TextAlign.center,
                style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_SMALL, color: ColorResources.COLOR_DIM_GRAY),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: Provider.of<CharityProvider>(context).getCharityList().length,
                itemBuilder: (context, index) => CharityCardWidget(Provider.of<CharityProvider>(context).getCharityList()[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

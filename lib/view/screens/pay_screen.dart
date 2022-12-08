import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/provider/organization_provider.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/pay_electricity_screen.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class PayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/Illustration/Untitled-1.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar
                CustomAppBar(title: Strings.PAY, color: ColorResources.COLOR_WHITE),

                Expanded(
                    child: ListView(physics: BouncingScrollPhysics(), children: [
                  // TypeBox
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: ColorResources.COLOR_WHITE.withOpacity(.24)),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: ColorResources.COLOR_WHITE.withOpacity(.24), borderRadius: BorderRadius.circular(25)),
                          child: Text(Strings.TO,
                              style: montserratSemiBold.copyWith(
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: ColorResources.COLOR_WHITE,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(Strings.SELECT_PAYEE_NAME,
                                style: montserratSemiBold.copyWith(
                                  fontSize: Dimensions.FONT_SIZE_SMALL,
                                  color: ColorResources.COLOR_WHITE,
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_forward, size: 20, color: ColorResources.COLOR_WHITE),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Receipt buttons
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 65,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/Icon/recipt.png', width: 22, height: 25, fit: BoxFit.fill),
                                SizedBox(width: 10),
                                Expanded(child: Text(Strings.RECEIPT, style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL))),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 65,
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              color: ColorResources.COLOR_WHITE,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/Icon/saved account.png', width: 22, height: 25, fit: BoxFit.fill),
                                SizedBox(width: 10),
                                Expanded(child: Text(Strings.SAVED_ACCOUNT, style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Icon Buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(Strings.ORGANIZATION_TYPES, style: poppinsRegular.copyWith(color: ColorResources.COLOR_WHITE)),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    height: 180,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconSquareButton(iconUrl: 'assets/Icon/electricity.png'),

                            IconSquareButton(iconUrl: 'assets/Icon/tv.png'),
                            IconSquareButton(iconUrl: 'assets/Icon/gass.png'),
                            IconSquareButton(iconUrl: 'assets/Icon/water.png'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            IconSquareButton(iconUrl: 'assets/Icon/telephn.png'),
                            IconSquareButton(iconUrl: 'assets/Icon/education.png'),
                            IconSquareButton(iconUrl: 'assets/Icon/health.png'),
                            IconSquareButton(iconUrl: 'assets/Icon/internet.png'),
                          ],
                        )
                      ],
                    ),
                  ),

                  // All Organization
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(Strings.ALL_ORGANIZATION, style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL)),
                  ),
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Provider.of<OrganizationProvider>(context).getOrganizationList().length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Image.asset(
                                Provider.of<OrganizationProvider>(context).getOrganizationList()[index].organizerImageUrl,
                                width: 25,
                                height: 31,
                                fit: BoxFit.scaleDown,
                              ),
                              SizedBox(width: 15),
                              Text(
                                Provider.of<OrganizationProvider>(context).getOrganizationList()[index].name,
                                style: poppinsRegular.copyWith(color: ColorResources.COLOR_CHARCOAL, fontSize: Dimensions.FONT_SIZE_SMALL),
                              ),
                            ],
                          ),
                        );
                      }),
                ])),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconSquareButton extends StatelessWidget {
  final String iconUrl;

  IconSquareButton({@required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 65,
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorResources.COLOR_WHITE,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: GestureDetector(child: Image.asset(iconUrl, width: 30, height: 30),
          onTap: (){ Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (context) => PayElectricity()));},),
      ),
    );
  }
}

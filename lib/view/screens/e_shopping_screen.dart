import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class EShoppingScreen extends StatelessWidget {
  WebViewPlusController _controller;
  @override
  Widget build(BuildContext context) {
    //TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          Image.asset(
            'assets/Illustration/Untitled-1.png',
            fit: BoxFit.fill,
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: ColorResources.COLOR_WHITE,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(right: Dimensions.STEP_RIGHT),
                      child: Text(
                        Strings.E_SHOPPING,
                        style: montserratSemiBold.copyWith(
                          color: ColorResources.COLOR_WHITE,
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_basket,
                        color: ColorResources.COLOR_WHITE,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: WebViewPlus(
                    onWebViewCreated: (controller) {
                      this._controller = controller;
                      controller.loadUrl("https://www.mbeche.com/store");
                    },
                    onPageFinished: (url) {},
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                )
                /*
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  width: double.infinity,
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(color: ColorResources.COLOR_WHITE, borderRadius: BorderRadius.circular(26)),
                  child: TextFormField(
                    style: poppinsSemiBold,
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ColorResources.COLOR_VERY_LIGHT_GRAY,
                        )),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  alignment: Alignment.center,
                  child: Text(
                    Strings.GET_BEST_PRODUCTS,
                    style: poppinsRegular.copyWith(
                      color: ColorResources.COLOR_WHITE,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / 1.3),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: EShoppingData.getAllShopProduct.length,
                        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                        itemBuilder: (BuildContext context, int index) => ProductWidget(EShoppingData.getAllShopProduct[index]),
                      ),
                      Positioned(
                        bottom: 1,
                        child: Container(
                          height: 50,
                          color: Colors.grey.withOpacity(.05),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 69,
                                height: 29,
                                decoration: BoxDecoration(
                                    color: ColorResources.COLOR_DARK_ORCHID, borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  Strings.ALL,
                                  style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_WHITE,
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 69,
                                height: 29,
                                decoration:
                                    BoxDecoration(color: ColorResources.COLOR_GAINSBORO, borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  Strings.CLOTHS,
                                  style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_ROYAL_BLUE,
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 69,
                                height: 29,
                                decoration:
                                    BoxDecoration(color: ColorResources.COLOR_GAINSBORO, borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  Strings.ELECTRONICS,
                                  style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_ROYAL_BLUE,
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 69,
                                height: 29,
                                decoration:
                                    BoxDecoration(color: ColorResources.COLOR_GAINSBORO, borderRadius: BorderRadius.circular(16)),
                                child: Text(
                                  Strings.DAILY,
                                  style: poppinsRegular.copyWith(
                                    color: ColorResources.COLOR_ROYAL_BLUE,
                                    fontSize: Dimensions.FONT_SIZE_EXTRA_SMALL,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/
              ],
            ),
          )
        ],
      ),
    );
  }
}

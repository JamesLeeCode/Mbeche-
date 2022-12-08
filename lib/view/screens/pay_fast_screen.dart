import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/view/screens/add_money_in_wallet.dart';
import 'package:wallet_ui_kit/view/screens/topup_screen.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class Payfast extends StatelessWidget {
  WebViewPlusController _controller;

  int amount = int.parse(payAmountContr.text) + 10 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(title: "TOP UP YOUR WALLET"),
          Expanded(
            child: WebViewPlus(
              onWebViewCreated: (controller) {
                this._controller = controller;
                controller.loadString(r"""
           <html 
           <body>
          <a href="https://www.payfast.co.za/eng/process?cmd=_paynow&amp;receiver=14976165&amp;item_name=Mbeche+Wallet+Credit&amp;item_description=Credit+your+Mbeche+wallet..&amp;amount= """ + amount.toString() + """&amp;return_url=https%3A%2F%2Fwww.ankhnegus.africa"><img src="https://www.payfast.co.za/images/buttons/light-small-paynow.png" width="165" height="36" alt="Pay" title="Pay Now with PayFast" /></a>  </body>
           </html>
            """);
              },
              onPageFinished: (url) {},
              javascriptMode: JavascriptMode.unrestricted,
            ),
          )
        ],
      )),
    );
  }
}

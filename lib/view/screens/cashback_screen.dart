import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:http/http.dart' as http;
class ValueAddedServices extends StatefulWidget {


  @override
  _ValueAddedServicesState createState() => _ValueAddedServicesState();
}

class _ValueAddedServicesState extends State<ValueAddedServices> {

  void initState() {
    super.initState();
    getWalletResult();
  }
  
  getWalletResult() async {
    Map<String, String> mainheader = {
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };

    var url =
        'https://api.nedbank.co.za/apimarket/b2b-sb/nb-vas/catalogue';
    var response = await http.get(
      url,
      headers: mainheader,
    );
    print('Response status: ${response.statusCode}');
    print('Account Details: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

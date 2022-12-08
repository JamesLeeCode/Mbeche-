import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  void initState() {
    super.initState();
    _showDialog();
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 5), () {
            Navigator.of(context).pop(true);
          });
          return LoadingPage();
        });
  }

  WebViewPlusController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(title: "CHATBOT"),
          Expanded(
            child: WebViewPlus(
              onWebViewCreated: (controller) {
                this._controller = controller;
                controller.loadUrl(
                "https://www.mbeche.com/chatbot.html");//    "https://web-chat.global.assistant.watson.cloud.ibm.com/preview.html?region=eu-gb&integrationID=9f8ef32b-2df7-47ea-a23a-24340a6c2bc5&serviceInstanceID=2463fbfd-c3c6-4bca-a5e9-8c0b57d162da");
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

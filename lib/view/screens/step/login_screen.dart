import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/services/auth_services.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/pixallet_onboarding_screen.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/startup_Screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_pass_field.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailControl = TextEditingController();
  TextEditingController passwordControl = TextEditingController();
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: loadingPage
          ? LoadingPage()
          : SafeArea(
              child: Column(
                children: [
                  /*  CustomAppBar(
              title: Strings.STEP3,
            ),*/
                  Expanded(
                    child: ListView(
                      children: [
                        Hero(
                          tag: 4,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3.0,
                            margin: EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 10),
                            padding: EdgeInsets.all(25),
                            child: Image.asset(
                              'assets/Illustration/fingerprint page.png',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Login Screen",
                            style: poppinsRegular.copyWith(fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 30, right: 20),
                            alignment: Alignment.center,
                            child: CustomTextField(
                                hintTxt: "Email Address",
                                isPhoneNumber: false,
                                controller: emailControl,
                                isEmail: true,
                                textInputType: TextInputType.emailAddress),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            padding: EdgeInsets.only(left: 30, right: 20),
                            alignment: Alignment.center,
                            child: CustomPassField(
                              hintTxt: "Password",
                              controller: passwordControl,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Dimensions.MARGIN_SIZE_DEFAULT,
                      left: Dimensions.MARGIN_SIZE_DEFAULT,
                      right: Dimensions.MARGIN_SIZE_DEFAULT,
                    ),
                    child: CustomButton(
                      btnTxt: Strings.CONTINUE,
                      onTap: () async {
                        setState(() {
                          loadingPage = true;
                        });
                        loggedInUser = emailControl.text;
                        try {
                          dynamic results =
                              await _auth.signInWithEmailAndPassword(
                                  emailControl.text, passwordControl.text);
                          results
                              ? Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WalletStartupScreen()))
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      MessageDialog("Error: " + firebaseError));
                        } catch (e) {
                          MessageDialog("Error: " + e.string);
                        }

                        //await getToken();
                        setState(() {
                          loadingPage = false;
                        });
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.only(left: 36, right: 36),
                    child: FlatButton(
                      child: Text(
                        "Forget Password???",
                        style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_DIM_GRAY),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ForgotPassword());
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.only(left: 36, right: 36),
                    child: FlatButton(
                      child: Text(
                        "Cancel",
                        style: poppinsRegular.copyWith(
                            color: ColorResources.COLOR_DIM_GRAY),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => PixalletOnBoardingScreen()));
                      },
                    ),
                  ),
                  /*  GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.SKIP,
                    style: montserratSemiBold.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                   Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 17,
                      color: ColorResources.COLOR_ROYAL_BLUE,
                    ),
                  )
                ],
              ), 
            ),*/
                  
                ],
              ),
            ),
    );
  }
}

String loggedInUser = " ";

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  AuthService _auth = AuthService();
  final resetpasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 3,
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.white, spreadRadius: 3)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/logo.jpg"),
                          fit: BoxFit.fitWidth)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: resetpasswordController,
                    style: TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        contentPadding: const EdgeInsets.all(15),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                          child: Text(
                            '  Cancel  ',
                            style: TextStyle(),
                          ),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(15),
                          textColor: Colors.red,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      FlatButton(
                          child: Text(
                            '  Reset Password  ',
                            style: TextStyle(),
                          ),
                          shape: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.pink, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(15),
                          textColor: Colors.pink,
                          onPressed: () async {
                            try {
                              dynamic results = await _auth
                                  .resetPassword(resetpasswordController.text);
                              setState(() {
                                resetpasswordController.clear();
                              });

                              Navigator.pop(context);
                              results
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          MessageDialog(
                                              "An Email with a link to reset your password was added to your email, open the link to reset your email"))
                                  : showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          MessageDialog(
                                              "Error: " + firebaseError));
                            } catch (e) {
                              MessageDialog("Error: " + e.string);
                              Navigator.pop(context);
                            }
                          }),
                    ],
                  ),
                ),
              ]),
        )));
  }
}

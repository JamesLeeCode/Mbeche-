import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';

TextEditingController addressControl = TextEditingController();
TextEditingController emailControl = TextEditingController();
TextEditingController passwordControl = TextEditingController();

class StepThreeScreen extends StatefulWidget {
  @override
  _StepThreeScreenState createState() => _StepThreeScreenState();
}

class _StepThreeScreenState extends State<StepThreeScreen> {
  String _validError;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: Strings.STEP3,
            ),
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
                      "Security",
                      style: poppinsRegular.copyWith(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
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
                          hintTxt: "Home Address",
                          isPhoneNumber: false,
                          controller: addressControl,
                          textInputType: TextInputType.streetAddress),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                    height: 15,
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
                        hintTxt: "Password",
                        isPhoneNumber: false,
                        controller: passwordControl,
                        textInputType: TextInputType.visiblePassword,
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
                onTap: () {
                  bool valid = true;
                  if (addressControl.text.length < 10) {
                    setState(() {
                      valid = false;
                      _validError =
                          "Please make sure you entered your address correctly";
                    });
                  }
                  if (emailControl.text.length < 5) {
                    setState(() {
                      _validError =
                          "Please make sure you entered your email correctly";
                      valid = false;
                    });
                  }
                  if (passwordControl.text.length <= 6) {
                    setState(() {
                      _validError =
                          "Please make sure your password is more than 6 characters";
                      valid = false;
                    });
                  }
                  if (valid == true) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => StepFourScreen()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            MessageDialog(_validError));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

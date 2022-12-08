import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_three_screen.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';

import 'package:wallet_ui_kit/view/screens/step/step_one_screen.dart';

TextEditingController namesControl = TextEditingController();
TextEditingController surnameControl = TextEditingController();
String occ;
String income;
String industry ;
class StepTwoScreen extends StatefulWidget {
  @override
  _StepTwoScreenState createState() => _StepTwoScreenState();
}

class _StepTwoScreenState extends State<StepTwoScreen> {
  String currentText = '';
  String _validError;
  var onTapRecognizer;
  TextEditingController textEditingController = TextEditingController()
    ..text = "";
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String _dropDownValue;
  String _dropDownValue1;
  String _dropDownValue2;
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  List<String> _occupations = [""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: Strings.STEP2,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                margin:
                    EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
                padding: EdgeInsets.all(25),
                child: Hero(
                  tag: 3,
                  child: Image.asset(
                    'assets/Illustration/verification pg.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Occupation",
                  style: poppinsRegular.copyWith(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /* Container(
                child: Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        length: 4,
                        appContext: context,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v.length < 3) {
                            return "I'm from validator";
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          selectedFillColor: Colors.transparent,
                          inactiveFillColor: Colors.transparent,
                          inactiveColor: ColorResources.COLOR_GRAY,
                          activeColor: ColorResources.COLOR_PRIMARY_DARK,
                          activeFillColor: hasError ? Colors.orange : Colors.transparent,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
              ),*/

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
                    child: DropdownButton(
                      hint: _dropDownValue == null
                          ? Text('Please select Occupation')
                          : Text(
                              _dropDownValue,
                              style: TextStyle(color: Colors.blue),
                            ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: occupations.map(
                        (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            _dropDownValue = val;
                          },
                        );
                      },
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Industry",
                  style: poppinsRegular.copyWith(
                    fontSize: 17,
                  ),
                ),
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
                    child: DropdownButton(
                      hint: _dropDownValue2 == null
                          ? Text('Please select Industry Types')
                          : Text(
                        _dropDownValue2,
                        style: TextStyle(color: Colors.blue),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: industryTypes.map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                              () {
                            _dropDownValue2 = val;
                          },
                        );
                      },
                    )),
              ),
              SizedBox(
                height: 15,
              ),


              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Income Types",
                  style: poppinsRegular.copyWith(
                    fontSize: 17,
                  ),
                ),
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
                    child: DropdownButton(
                      hint: _dropDownValue1 == null
                          ? Text('Please select Income Types')
                          : Text(
                        _dropDownValue1,
                        style: TextStyle(color: Colors.blue),
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      style: TextStyle(color: Colors.blue),
                      items: incomeTypes.map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        setState(
                              () {
                            _dropDownValue1 = val;
                          },
                        );
                      },
                    )),
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
                      hintTxt: "Home Address",
                      isPhoneNumber: false,
                      controller: addressControl,
                      textInputType: TextInputType.streetAddress),
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
                    if (_dropDownValue == null) {
                      setState(() {
                        valid = false;
                        _validError = "Please select your occupation";
                      });
                    }

                    if (_dropDownValue1 == null) {
                      setState(() {
                        valid = false;
                        _validError = "Please select your Income Type";
                      });
                    }

                    if (_dropDownValue2 == null) {
                      setState(() {
                        valid = false;
                        _validError = "Please select your Industry Type";
                      });
                    }

                    occ = _dropDownValue.substring(_dropDownValue.indexOf('-') + 1, _dropDownValue.length );
                   income = _dropDownValue1.substring(_dropDownValue1.indexOf('-') + 1, _dropDownValue1.length );
                   industry = _dropDownValue2.substring(_dropDownValue2.indexOf('-') + 1, _dropDownValue2.length );


                    if (addressControl.text.length < 10) {
                      setState(() {
                        valid = false;
                        _validError =
                            "Please make sure you entered your address correctly";
                      });
                    }


                    if (valid == true) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              StepFourScreen())); //StepThreeScreen()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              MessageDialog(_validError));
                    }
                  },
                ),
              ),
              /* Container(
                margin: EdgeInsets.only(bottom: 15),
                child: Center(
                    child: Text(
                  Strings.RESEND_CODE_IN,
                  style: poppinsRegular,
                )),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/dimensions.dart';
import 'package:wallet_ui_kit/utility/strings.dart';
import 'package:wallet_ui_kit/utility/style.dart';
import 'package:wallet_ui_kit/view/screens/send_money1_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_four_screen.dart';
import 'package:wallet_ui_kit/view/screens/step/step_two_screen.dart';
import 'package:wallet_ui_kit/view/screens/terms.dart';
import 'package:wallet_ui_kit/view/widgets/button/custom_button.dart';
import 'package:wallet_ui_kit/view/widgets/custom_app_bar.dart';
import 'package:wallet_ui_kit/view/widgets/edittext/custom_text_field.dart';

import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;


List<dynamic> occupations;
List<dynamic> incomeTypes;
List<dynamic> industryTypes;

TextEditingController phoneControl = TextEditingController();

class StepOneScreen extends StatefulWidget {
  @override
  _StepOneScreenState createState() => _StepOneScreenState();
}

class _StepOneScreenState extends State<StepOneScreen> {
  void initState() {
    super.initState();
    getToken();
    _showDialog();
  }
  String token;
  String arrayText;
  getToken() async {
    Map<String, String> mainheader = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nboauth/oauth20/token';
    var response = await http.post(
      url,
      headers: mainheader,
      body: {
        'client_id': '1ec68e41-ffce-4309-9c44-eb6f5196dc8e',
        'client_secret': 'dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX',
        'grant_type': 'client_credentials',
        'scope': 'tpp_client_credential'
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      token = jsonResponse['access_token'];
      print('Token is: $token.');

      await getOccupationTypes();
      await getIndustryTypes();
      await getIncomeTypes();


    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  getOccupationTypes() async {

    Map<String, String> mainheader = {
     // "Content-Type": "Application/json",
      //"x-fapi-financial-id":"OB/2017/001",
      "Authorization": token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };

    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/configuration/occupation-types';
    var response = await http.get(
      url,
      headers: mainheader,
    );
    //print('Response : ${response.body}');

     arrayText = response.body;
    var occupationsJson = json.decode(arrayText) as List;

     occupations = occupationsJson.map<String>((e) => e['Description'] + "-" + e['Code']  ).toList();
    //occupations = tagsJson != null ? List.from(tagsJson) : null;
    print('Response  occupation there : $occupations');

  }


  getIndustryTypes() async {

    Map<String, String> mainheader = {
      // "Content-Type": "Application/json",
      //"x-fapi-financial-id":"OB/2017/001",
      "Authorization": token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };

    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/configuration/industry-types';
    var response = await http.get(
      url,
      headers: mainheader,
    );

    arrayText = response.body;
    var industryTypesJson = json.decode(arrayText) as List;

    industryTypes = industryTypesJson.map<String>((e) => e['Description'] + "-" + e['Code']  ).toList();
    //occupations = tagsJson != null ? List.from(tagsJson) : null;
    print('Response  occupation there : $industryTypes');

  }

  getIncomeTypes() async {

    Map<String, String> mainheader = {
      // "Content-Type": "Application/json",
      //"x-fapi-financial-id":"OB/2017/001",
      "Authorization": token,
      "x-ibm-client-id": "1ec68e41-ffce-4309-9c44-eb6f5196dc8e",
      "x-ibm-client-secret":
      "dH5qW0mS8cE2lQ8yJ0yX1xQ1bI0nS2eL5gO5cW7fB4hI0jS1dX",
    };

    var url =
        'https://api.nedbank.co.za/apimarket/sandbox/nb-wallet/configuration/income-types';
    var response = await http.get(
      url,
      headers: mainheader,
    );

    var incomeTypesJson = json.decode(arrayText) as List;

    incomeTypes = incomeTypesJson.map<String>((e) => e['Description'] + "-" + e['Code']  ).toList();
    //occupations = tagsJson != null ? List.from(tagsJson) : null;
    print('Response  occupation there : $incomeTypes');

  }

  String _validError;
  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context, builder: (BuildContext context) => TermsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_REGISTRATION_BACKGROUND,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                title: Strings.STEP1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.0,
                margin:
                    EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 10),
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'assets/Illustration/registration page.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Center(
                child: Text(
                  Strings.REGISTRATION,
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
                    hintTxt: "First Names",
                    isPhoneNumber: false,
                    controller: namesControl,
                    textInputType: TextInputType.text,
                  ),
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
                    hintTxt: "Surname",
                    isPhoneNumber: false,
                    controller: surnameControl,
                    textInputType: TextInputType.text,
                  ),
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
                    hintTxt: "Identity Number",
                    isPhoneNumber: false,
                    controller: idControl,
                    textInputType: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  Strings.ENTER_YOUR_MOBILE,
                  textAlign: TextAlign.center,
                  style: montserratRegular.copyWith(
                      fontSize: Dimensions.FONT_SIZE_SMALL),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: double.infinity,
                height: 44,
                margin: EdgeInsets.only(right: 20, left: 20),
                padding: EdgeInsets.only(left: 20, right: 10),
                decoration: BoxDecoration(
                    color: ColorResources.COLOR_WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                        color: ColorResources.COLOR_WHITE_GRAY, width: 2)),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: print,
                      initialSelection: '+27',
                      favorite: ['+27'],
                      showCountryOnly: false,
                      textStyle: poppinsRegular.copyWith(
                        fontSize: 13,
                      ),
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      flex: 3,
                      child: CustomTextFieldPhone(
                        hintTxt: Strings.MOBILE_NUMBER,
                        isPhoneNumber: true,
                        controller: phoneControl,
                        textInputType: TextInputType.phone,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: ColorResources.COLOR_DARK_ORCHID,
                              width: 2,
                            )),
                        child: Icon(
                          Icons.done,
                          color: ColorResources.COLOR_ROYAL_BLUE,
                          size: 15,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                child: CustomButton(
                  btnTxt: Strings.CONTINUE,
                  onTap: () {
                    bool valid = true;
                    if (namesControl.text.length < 3) {
                      setState(() {
                        valid = false;
                        _validError =
                            "Please make sure you entered your First Name";
                      });
                    }
                    if (surnameControl.text.length < 5) {
                      setState(() {
                        _validError =
                            "Please make sure you entered your Surname";
                        valid = false;
                      });
                    }
                    if (phoneControl.text.length < 9 ||
                        phoneControl.text.length > 9) {
                      setState(() {
                        _validError =
                            "Please make sure your Phone Number is valid, 9 numbers needed";
                        valid = false;
                      });
                    }
                    if (idControl.text.length < 13 ||
                        idControl.text.length < 13) {
                      setState(() {
                        _validError =
                            "Please enter a valid South African ID Number";
                        valid = false;
                      });
                    }
                    if (valid == true) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => StepTwoScreen()));
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              MessageDialog(_validError));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

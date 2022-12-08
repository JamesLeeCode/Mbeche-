import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/repository/step_repo.dart';

class StepProvider with ChangeNotifier{
  StepRepo stepRepo;
  StepProvider({this.stepRepo});

  String _countryCode='';
  String get countryCode=>_countryCode;
  List<String> _countryCodeList = [];
  List<String> get countryCodeList => _countryCodeList;

  updateCountryCode(String value){
    _countryCode=value;
    notifyListeners();
  }

  void  initializeCountryCodeList(){
    if(_countryCodeList.length==0){
      _countryCodeList.clear();
      _countryCodeList=stepRepo.getCountryList;
      _countryCode=stepRepo.getCountryList[2];
      notifyListeners();
    }
  }
}
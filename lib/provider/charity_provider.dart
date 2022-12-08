import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/charity_model.dart';
import 'package:wallet_ui_kit/data/repository/charity_repo.dart';

class CharityProvider extends ChangeNotifier {
  final CharityRepo charityRepo;
  CharityProvider({@required this.charityRepo});

  List<CharityModel> getCharityList() {
    return charityRepo.getCharityList();
  }
}
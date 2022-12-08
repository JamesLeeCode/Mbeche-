import 'package:flutter/material.dart';
import 'package:wallet_ui_kit/data/models/promo_model.dart';
import 'package:wallet_ui_kit/data/repository/promo_repo.dart';

class PromoProvider extends ChangeNotifier {
  final PromoRepo promoRepo;
  PromoProvider({@required this.promoRepo});

  List<PromoModel> getPromoList() {
    return promoRepo.getPromoData();
  }
}
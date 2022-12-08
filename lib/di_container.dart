import 'package:get_it/get_it.dart';
import 'package:wallet_ui_kit/data/repository/charity_repo.dart';
import 'package:wallet_ui_kit/data/repository/e_shopping_Data.dart';
import 'package:wallet_ui_kit/data/repository/gift_repo.dart';
import 'package:wallet_ui_kit/data/repository/goals_repo.dart';
import 'package:wallet_ui_kit/data/repository/loan_data.dart';
import 'package:wallet_ui_kit/data/repository/onboarding_repo.dart';
import 'package:wallet_ui_kit/data/repository/organization_repo.dart';
import 'package:wallet_ui_kit/data/repository/promo_repo.dart';
import 'package:wallet_ui_kit/data/repository/step_repo.dart';
import 'package:wallet_ui_kit/provider/charity_provider.dart';
import 'package:wallet_ui_kit/provider/gift_provider.dart';
import 'package:wallet_ui_kit/provider/goals_provider.dart';
import 'package:wallet_ui_kit/provider/organization_provider.dart';
import 'package:wallet_ui_kit/provider/promo_provider.dart';
import 'package:wallet_ui_kit/provider/step_provider.dart';


final sl = GetIt.instance;

Future<void> init() async {


  // Repository
  sl.registerLazySingleton(() => CharityRepo());
  sl.registerLazySingleton(() => EShoppingData());
  sl.registerLazySingleton(() => GiftRepo());
  sl.registerLazySingleton(() => GoalsRepo());
  sl.registerLazySingleton(() => LoanData());
  sl.registerLazySingleton(() => OnboardingRepo());
  sl.registerLazySingleton(() => OrganizationRepo());
  sl.registerLazySingleton(() => PromoRepo());
  sl.registerLazySingleton(() => StepRepo());

  // Provider
  sl.registerFactory(() => CharityProvider(charityRepo: sl()));
  sl.registerFactory(() => GiftProvider(giftRepo: sl()));
  sl.registerFactory(() => GoalsProvider(goalsRepo: sl()));
  sl.registerFactory(() => OrganizationProvider(organizationRepo: sl()));
  sl.registerFactory(() => PromoProvider(promoRepo: sl()));
  sl.registerFactory(() => StepProvider(stepRepo: sl()));


}

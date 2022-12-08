import 'package:wallet_ui_kit/data/models/get_started_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';

class OnboardingRepo {
  static List<GetStartedModel> getAllStartedData = [
    GetStartedModel(
      imageUrl: 'assets/images/bg1.gif',
      title: "PAY BILLS HERE",
    ),
    GetStartedModel(
      imageUrl: 'assets/images/bg.gif',
      title: "Manage money on the go",
    ),
    GetStartedModel(
      imageUrl: 'assets/images/bg2.gif',
      title: "EASY,CHEAP AND SAFE ",
    ),
  ];

  static List<GetStartedModel> getStartedModelDataSecondSlides = [
    GetStartedModel(
      secondSlideText:
          " Send.Buy.Pay.Save.Withdraw",
      color1: ColorResources.COLOR_ROYAL_BLUE,
      color2: ColorResources.COLOR_GRAY,
      color3: ColorResources.COLOR_GRAY,
    ),
    GetStartedModel(
      secondSlideText:
          "Manage money on the go",
      color1: ColorResources.COLOR_GRAY,
      color2: ColorResources.COLOR_ROYAL_BLUE,
      color3: ColorResources.COLOR_GRAY,
    ),
    GetStartedModel(
      secondSlideText:
          "Apply.Loan.Invest.Insure",
      color1: ColorResources.COLOR_GRAY,
      color2: ColorResources.COLOR_GRAY,
      color3: ColorResources.COLOR_ROYAL_BLUE,
    ),
  ];
}

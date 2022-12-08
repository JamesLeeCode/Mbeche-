import 'package:wallet_ui_kit/data/models/charity_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/strings.dart';

class CharityRepo {
  List<CharityModel> getCharityList() {
    List<CharityModel> charityList = [
      CharityModel(
        imageUrl: 'assets/images/291.png',
        condition: Strings.ONGOING,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: 'assets/images/move_green.png',
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color2: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color3: ColorResources.COLOR_DODGER_BLUE,
      ),
      CharityModel(
        imageUrl: 'assets/images/291.png',
        condition: Strings.CLOSED,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: 'assets/images/move_green.png',
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_CARROT_ORANGE,
        color2: ColorResources.COLOR_CARROT_ORANGE,
        color3: ColorResources.COLOR_ALIZARIN,
      ),
      CharityModel(
        imageUrl: 'assets/images/291.png',
        condition: Strings.ONGOING,
        title: Strings.TREE_PLANTATION,
        description: Strings.DUIS_AUTE,
        titleRightImageUrl: 'assets/images/move_green.png',
        price1: Strings.DOLLER29,
        price2: Strings.DOLLER49,
        color1: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color2: ColorResources.COLOR_BRIGHT_TURQUOISE,
        color3: ColorResources.COLOR_DODGER_BLUE,
      ),
    ];
    return charityList;
  }
}

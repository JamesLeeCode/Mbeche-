import 'package:wallet_ui_kit/data/models/my_goals_model.dart';
import 'package:wallet_ui_kit/utility/colorResources.dart';
import 'package:wallet_ui_kit/utility/strings.dart';

class GoalsRepo {
  List<MyGoalsModel> getGoalsList() {
    List<MyGoalsModel> goalsList = [
      MyGoalsModel(
        imageUrl: 'assets/images/goal1.jpeg',
        goalTitle: Strings.ONGOING,
        color1: ColorResources.COLOR_WHITE,
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/images/goal2.jpeg',
        goalTitle: Strings.UPCOMING,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE,
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/images/goal3.jpeg',
        goalTitle: Strings.COMPLETE,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE,
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/images/goal4.jpeg',
        goalTitle: Strings.ONGOING,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE,
        color5: ColorResources.COLOR_WHITE.withOpacity(.51),
      ),
      MyGoalsModel(
        imageUrl: 'assets/images/goal5.jpeg',
        goalTitle: Strings.COMPLETE,
        color1: ColorResources.COLOR_WHITE.withOpacity(.51),
        color2: ColorResources.COLOR_WHITE.withOpacity(.51),
        color3: ColorResources.COLOR_WHITE.withOpacity(.51),
        color4: ColorResources.COLOR_WHITE.withOpacity(.51),
        color5: ColorResources.COLOR_WHITE,
      ),
    ];
    return goalsList;
  }
}

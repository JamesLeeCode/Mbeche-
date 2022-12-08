import 'package:wallet_ui_kit/data/models/gift_model.dart';
import 'package:wallet_ui_kit/utility/strings.dart';

class GiftRepo {
  List<GiftModel> getGiftList() {
    List<GiftModel> giftList = [
      GiftModel(
        imageUrl: 'assets/Illustration/gift4.png',
        title: Strings.BIRTHDAY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift3.png',
        title: Strings.EID_MUBARAK,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift2.png',
        title: Strings.CHINESE_NEW_YEAR,
        isSelected: true,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift.png',
        title: Strings.ANIVERSARY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift4.png',
        title: Strings.BIRTHDAY,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift3.png',
        title: Strings.EID_MUBARAK,
        isSelected: false,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift2.png',
        title: Strings.CHINESE_NEW_YEAR,
        isSelected: true,
      ),
      GiftModel(
        imageUrl: 'assets/Illustration/gift.png',
        title: Strings.ANIVERSARY,
        isSelected: false,
      ),
    ];
    return giftList;
  }
}

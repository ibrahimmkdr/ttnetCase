import 'package:get/get.dart';

class CountryCardController extends GetxController {
  final expandedCards = <String, bool>{}.obs;

  void toggleCard(String cardId) {
    expandedCards[cardId] = !(expandedCards[cardId] ?? false);
  }

  bool isExpanded(String cardId) {
    return expandedCards[cardId] ?? false;
  }
}

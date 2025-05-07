import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:ttnetcase/models/country_model.dart';

class TimerController extends GetxController {
  final isSelected = false.obs;
  final elapsedTime = "00:00:00".obs;
  final download = "0MB".obs;
  final upload = "0MB".obs;
  final signalStrength = "%14".obs;

  Timer? _timer;
  int _seconds = 0;
  final Random _random = Random();

  var selectedCountry = CountryModel().obs;

  void toggleSelection(CountryModel countyInfo) {
    if (selectedCountry.value.id == countyInfo.id) {
      selectedCountry.value = CountryModel();
      stopTimer();
    } else {
      selectedCountry.value = countyInfo;
      startTimer();
    }
  }

  void startTimer() {
    _seconds = 0;
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _seconds++;

        int hours = _seconds ~/ 3600;
        int minutes = (_seconds % 3600) ~/ 60;
        int seconds = _seconds % 60;

        elapsedTime.value =
            '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

        int down = 15;
        int up = 10;
        down += 3;
        up += 3;

        int strength = 14 + _random.nextInt(80);
        signalStrength.value = '%$strength';
        download.value = '${down}Mb';
        upload.value = '${up}Mb';
      },
    );
  }

  void stopTimer() {
    _timer?.cancel();
    selectedCountry.value = CountryModel();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}

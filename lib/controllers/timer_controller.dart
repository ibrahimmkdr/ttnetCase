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
  final randomCity = ''.obs;

  Timer? _timer;
  int _seconds = 0;
  int _download = 15;
  int _upload = 10;
  final Random _random = Random();

  var selectedCountry = CountryModel().obs;

  void toggleSelection(CountryModel countryInfo) {
    if (selectedCountry.value.id == countryInfo.id) {
      selectedCountry.value = CountryModel();
      stopTimer();
    } else {
      selectedCountry.value = countryInfo;

      if (countryInfo.countryCity != null &&
          countryInfo.countryCity!.isNotEmpty) {
        randomCity.value = countryInfo
            .countryCity![_random.nextInt(countryInfo.countryCity!.length)];
      } else {
        randomCity.value = '';
      }

      startTimer();
    }
  }

  void startTimer() {
    _seconds = 0;
    _download = 15;
    _upload = 10;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _seconds++;

      int hours = _seconds ~/ 3600;
      int minutes = (_seconds % 3600) ~/ 60;
      int seconds = _seconds % 60;

      elapsedTime.value =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

      int strength = 14 + _random.nextInt(50);
      signalStrength.value = '%$strength';

      _download += 2;
      _upload += 1;

      download.value = '$_download MB';
      upload.value = '$_upload MB';
    });
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

extension TimeExtension on int {
  String formattedTime() {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    int seconds = this % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

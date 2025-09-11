extension DateTimeExtension on DateTime {
  String get differenceFromNow =>
      "${DateTime.now().difference(this).inHours}h Ago";

  String get toMDY =>
      "${day.toString().padLeft(2, "0")}/${month.toString().padLeft(2, "0")}/$year";
}

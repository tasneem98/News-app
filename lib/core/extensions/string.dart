extension StringExtension on String {
  //! Convert Date "in the format MM/DD/YYYY (e.g. 12/02/2020)" to String
  String get toDMYDate {
    final parsedDate = DateTime.parse(this);
    return "${parsedDate.day.toString().padLeft(2, "0")}/${parsedDate.month.toString().padLeft(2, "0")}/${parsedDate.year}";
  }

  //! First letter of each word to uppercase
  String get toTitleCase => split(
    " ",
  ).map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
}

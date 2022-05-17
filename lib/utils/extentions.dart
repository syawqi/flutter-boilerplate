extension StringExtention on String {
  //make String Title Case
  String get titleCase => split(" ")
      .map((str) => '${str[0].toUpperCase()}${str.substring(1)}')
      .join(" ");

  //make String camelCase
  String get camelCase =>
      "${this[0].toLowerCase()}${titleCase.replaceAll(" ", "").substring(1)}";
}

extension StringExtension on String {
  String capitalizeText() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

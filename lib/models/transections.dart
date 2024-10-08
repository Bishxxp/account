
class Transactions {
  final int? keyID;
  final String title;
  final String club;
  final String country;
  final DateTime date;

  Transactions({
    this.keyID,
    required this.title,
    required this.club,
    required this.country,
    required this.date,
  });
}

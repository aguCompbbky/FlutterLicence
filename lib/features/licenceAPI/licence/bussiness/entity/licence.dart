

class Licence{
  Licence({required this.id, required this.licenseName, required this.startDate, required this.endDate, required this.licensePrice, required this.products, required this.amountOfUser,  required this.isAktive});

  final int id;
  final String licenseName;
  final DateTime startDate;
  final DateTime endDate;
  final List<int> products;
  final int amountOfUser;
  final double licensePrice;
  final bool isAktive;
}
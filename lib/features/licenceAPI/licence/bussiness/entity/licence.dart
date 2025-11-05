
import 'package:licence/features/licenceAPI/product/bussiness/entity/product.dart';

class Licence{
  Licence({required this.id, required this.licenseName, required this.startDate, required this.endDate, required this.products, required this.amountOfUser, required this.licensePrice, required this.isAktive});

  final int id;
  final String licenseName;
  final DateTime startDate;
  final DateTime endDate;
  final List<Product> products;
  final int amountOfUser;
  final double licensePrice;
  final bool isAktive;
}
import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/repository/licence_repository.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';
import 'package:licence/features/licenceAPI/product/data/DTO_model/product_dto.dart';

class LicenceManagerUsecase {
  LicenceManagerUsecase({required this.repo});

  final LicenceRepository repo;

  Future<List<Licence>> getAllLicences() async => await repo.getAllLicences();

  Future<Licence> getLicenceById(int id) async => await repo.getLicenceById(id);

//buradaki product kafamı ağrıtabilir
  Future<Licence> updateLicence(
    int id,
    String licenseName,
    DateTime startDate,
    DateTime endDate,
    List<ProductDto> products,
    int amountOfUser,
    double licensePrice,
    bool isAktive,
  )async => await repo.updateLicence(id, LicenceDto(id: id, licenseName: licenseName, startDate: startDate, endDate: endDate, products: products, amountOfUser: amountOfUser, licensePrice: licensePrice, isAktive: isAktive));

  
}

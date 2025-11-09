import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/repository/licence_repository.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';

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
    double licensePrice,
    List<int> products,
    int amountOfUser,
    bool isAktive,
  )async => await repo.updateLicence(id, LicenceDto(id: id, licenseName: licenseName, startDate: startDate, endDate: endDate, products: products, amountOfUser: amountOfUser, licensePrice: licensePrice, isAktive: isAktive));

  Future<void> deleteLicence(int id)async => await repo.deleteLicence(id);
}

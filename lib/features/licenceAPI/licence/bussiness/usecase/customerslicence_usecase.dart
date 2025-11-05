import 'package:licence/features/auth/bussiness/repository/auth_repository.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/repository/licence_repository.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';


//jwtden customerin idsini kullanmallıyız
class CustomerslicenceUsecase {
  CustomerslicenceUsecase({required this.authRepo, required this.licenceRepo});

  final AuthRepository authRepo;
  final LicenceRepository licenceRepo;

  Future<Licence> addLicenseToCustomer(LicenceDto licence) async {
    

    final customerId = await authRepo.getCurrentCustomerId();

    final addedLicence = await licenceRepo.addLicenseToCustomer(customerId, licence);

    return addedLicence;
  }

  Future<List<Licence>> getLicensesOfCustomer() async {
    final customerId = await authRepo.getCurrentCustomerId();

    final licenceList = await licenceRepo.getLicensesOfCustomer(customerId);

    return licenceList;
  }
  
}
import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';

abstract class LicenceRepository {
  
  Future<List<Licence>> getAllLicences();

  
  Future<Licence> getLicenceById(int id);

  
  Future<void> deleteLicence(int id);

  
  Future<Licence> updateLicence(int id, LicenceDto licence);

  
  Future<Licence> addLicenseToCustomer(int customerId, LicenceDto licence);

  
  Future<List<Licence>> getLicensesOfCustomer(int customerId);
}

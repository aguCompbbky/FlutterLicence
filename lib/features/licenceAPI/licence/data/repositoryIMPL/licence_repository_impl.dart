import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/repository/licence_repository.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';
import 'package:licence/features/licenceAPI/licence/data/data_source/licence_remote_data_source.dart';

class LicenceRepositoryImpl implements LicenceRepository {
  LicenceRepositoryImpl({required this.remote});

  final LicenceRemoteDataSource remote;
  @override
  Future<Licence> addLicenseToCustomer(
    int customerId,
    LicenceDto licence,
  ) async {
    final body = licence.toJson();
    final result = await remote.addLicenseToCustomer(customerId, body);
    final addedLicence = LicenceDto.fromJson(result).toEntity();
    return addedLicence;
  }

  @override
  Future<void> deleteLicence(int id) async{
    await remote.deleteLicence(id);
  }

  @override
  Future<List<Licence>> getAllLicences() async{
    final licenceListRaw = await remote.getAllLicences();
    final List<Licence> licenceList = licenceListRaw.map((e) => LicenceDto.fromJson(e).toEntity()).toList();
    return licenceList;
  }

  @override
  Future<Licence> getLicenceById(int id) async{
    final result = await remote.getLicenceById(id);
    final licence = LicenceDto.fromJson(result).toEntity();
    return licence;
  }

  @override
  Future<List<Licence>> getLicensesOfCustomer(int customerId) async {
    final resultList  = await remote.getLicensesOfCustomer(customerId);
    final licenceList = resultList.map((e)=> LicenceDto.fromJson(e).toEntity()).toList();//! burada pataladı
    return licenceList;
  }

  @override
  Future<Licence> updateLicence(int id, LicenceDto licence) async{
    final body = licence.toJson();
    final result = await remote.updateLicence(id, body);
    final updatedLicence = LicenceDto.fromJson(result).toEntity();
    return updatedLicence;
  }
}

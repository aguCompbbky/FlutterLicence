import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';

abstract class LicenceState {}
// 1. Başlangıç Durumları
class LicenceInitial extends LicenceState {}
class LicenceLoading extends LicenceState {}

// 2. Başarılı Durumlar
class LicenceLoaded extends LicenceState {
  final List<Licence> licences;
   LicenceLoaded(this.licences);
}

class LicenceAdded extends LicenceState {
  final Licence newLicence;
   LicenceAdded(this.newLicence);
}

// 3. Hata Durumları
class LicenceError extends LicenceState {
  final String errorMessage;
  LicenceError(this.errorMessage);
}
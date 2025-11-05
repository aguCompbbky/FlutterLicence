import 'package:licence/features/licenceAPI/licence/bussiness/entity/licence.dart';

abstract class LicenceState {}

class LicenceInitialState extends LicenceState {}
class LicenceLoadingState extends LicenceState {}

class LicenceDeletedState extends LicenceState{}
class LicenceLoadedState extends LicenceState {
  final List<Licence> licences;
   LicenceLoadedState(this.licences);
}

class LicenceAddedState extends LicenceState {
  final Licence newLicence;
   LicenceAddedState(this.newLicence);
}

class LicenceErrorState extends LicenceState {
  final String errorMessage;
  LicenceErrorState(this.errorMessage);
}
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/bloc/licence_state.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/usecase/customerslicence_usecase.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/usecase/licence_manager_usecase.dart';
import 'package:licence/features/licenceAPI/licence/data/DTO_model/licence_dto.dart';
import 'package:licence/features/licenceAPI/product/data/DTO_model/product_dto.dart';

class LicenceCubit extends Cubit<LicenceState> {
  final LicenceManagerUsecase licenceUsecase;
  final CustomerslicenceUsecase customerslicenceUsecase;
  LicenceCubit({required this.licenceUsecase,required this.customerslicenceUsecase}) : super(LicenceInitialState());

  Future<void> getAllLicences() async {
    try {
      emit(LicenceLoadingState());
      final result = await licenceUsecase.getAllLicences();
      emit(LicenceLoadedState(result));
    } catch (e) {
      emit(LicenceErrorState(e.toString()));
    }
  }

  Future<void> getLicenceById(int id) async {
    try {
      emit(LicenceLoadingState());
      final result = await licenceUsecase.getLicenceById(id);
      emit(LicenceLoadedState([result]));
    } catch (e) {
      emit(LicenceErrorState(e.toString()));
    }
  }

  Future<void> deleteLicence(int id) async {
    try {
      emit(LicenceLoadingState());
      await licenceUsecase.deleteLicence(id);
      emit(LicenceDeletedState());
    } catch (e) {
      emit(LicenceErrorState(e.toString()));
    }
  }
  //sıkıntı çıkabilir
  Future<void> updateLicence(
    int id,
    String licenseName,
    DateTime startDate,
    DateTime endDate,
    double licensePrice,
    List<int> products,
    int amountOfUser,
    bool isAktive,
  ) async {
    try {
      emit(LicenceLoadingState());
      final result = await licenceUsecase.updateLicence(id, licenseName, startDate, endDate, licensePrice,  products, amountOfUser,  isAktive);
      emit(LicenceAddedState(result));
    } catch (e) {     
      emit(LicenceErrorState(e.toString()));
    }
  }



  Future<void> addLicenseToCustomer(int id,
   String licenseName,
   DateTime startDate,
   DateTime endDate,
   double licensePrice,
   List<int> products,
   int amountOfUser,
   bool isAktive,
   )async{
    try {
      emit(LicenceLoadingState());
      debugPrint("id :<<$id");
      final result = await customerslicenceUsecase.addLicenseToCustomer(LicenceDto(id: 9, licenseName: licenseName, startDate: startDate, endDate: endDate, licensePrice: licensePrice, productIds: products, amountOfUser: amountOfUser,  isAktive: isAktive));
      emit(LicenceAddedState(result));
    } catch (e) {
      emit(LicenceErrorState(e.toString()));
    }
  }


  Future<void> getLicensesOfCustomer() async {
    try {
      emit(LicenceLoadingState());
      final result = await customerslicenceUsecase.getLicensesOfCustomer();
      emit(LicenceLoadedState(result));
    } catch (e) {
      debugPrint("${e} load hataa");
      emit(LicenceErrorState(e.toString()));
    }
  }

}

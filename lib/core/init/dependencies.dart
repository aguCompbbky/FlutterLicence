import 'package:licence/client.dart';
import 'package:licence/core/constants/network.dart';
import 'package:licence/features/auth/bussiness/usecase/login_usecase.dart';
import 'package:licence/features/auth/bussiness/usecase/register_usecase.dart';
import 'package:licence/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:licence/features/auth/data/repositoryIMPL/auth_repository_impl.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/usecase/customerslicence_usecase.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/usecase/licence_manager_usecase.dart';
import 'package:licence/features/licenceAPI/licence/data/data_source/licence_remote_data_source.dart';
import 'package:licence/features/licenceAPI/licence/data/repositoryIMPL/licence_repository_impl.dart';
import 'package:licence/features/licenceAPI/product/bussiness/usecase/product_%20manager_usecase.dart';
import 'package:licence/features/licenceAPI/product/data/data_source/product_remote_data_source.dart';
import 'package:licence/features/licenceAPI/product/data/repositoryIMPL/product_repository_impl.dart';

class Dependencies {
  static late final ProductManagerUsecase productManagerUsecase;
  static late final LoginUsecase loginUsecase;
  static late final RegisterUsecase registerUsecase;
  static late final LicenceManagerUsecase licenceManagerUsecase;
  static late final CustomerslicenceUsecase customerslicenceUsecase;

  static void init() {
    final client = Client(Network.baseUrlEmulator);

    // Product 
    final productRemoteDataSource = ProductRemoteDataSource(client: client);
    final productRepository = ProductRepositoryImpl(remote: productRemoteDataSource);
    productManagerUsecase = ProductManagerUsecase(repo: productRepository);

    // Auth 
    final authRemoteDataSource = AuthRemoteDataSource(client: client);
    final authRepository = AuthRepositoryImpl(remote: authRemoteDataSource);
    loginUsecase = LoginUsecase(repo: authRepository);
    registerUsecase = RegisterUsecase(repo: authRepository);


    // Licence
    final licenceRemoteDataSource = LicenceRemoteDataSource(client: client);
    final licenceRepository = LicenceRepositoryImpl(remote: licenceRemoteDataSource);
    licenceManagerUsecase = LicenceManagerUsecase(repo: licenceRepository);
    customerslicenceUsecase = CustomerslicenceUsecase(authRepo: authRepository, licenceRepo: licenceRepository);
  }
}

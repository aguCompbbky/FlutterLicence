import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/client.dart';
import 'package:licence/core/constants/network.dart';
import 'package:licence/core/routers/gorouter_conf.dart';
import 'package:licence/core/themes/app_theme.dart';
import 'package:licence/features/licenceAPI/bussiness/bloc/product_cubit.dart';
import 'package:licence/features/licenceAPI/bussiness/usecase/product_%20manager_usecase.dart';

import 'package:licence/features/licenceAPI/data/data_source/product_remote_data_source.dart';
import 'package:licence/features/licenceAPI/data/repositoryIMPL/product_repository_impl.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final client = Client(Network.baseUrlEmulator); 
    final productRemoteDataSource = ProductRemoteDataSource(client: client);
    final productRepository = ProductRepositoryImpl(remote: productRemoteDataSource);
    final productManagerUsecase = ProductManagerUsecase(repo: productRepository);


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (e)=>ProductCubit(productUsecase: productManagerUsecase))
      ],
      child: MaterialApp.router(
        routerConfig: GoRouterConf.configRoutes(context),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/core/init/dependencies.dart';
import 'package:licence/core/routers/gorouter_conf.dart';
import 'package:licence/core/themes/app_theme.dart';
import 'package:licence/features/auth/bussiness/bloc/auth_cubit.dart';
import 'package:licence/features/licenceAPI/licence/bussiness/bloc/licence_cubit.dart';
import 'package:licence/features/licenceAPI/product/bussiness/bloc/product_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Dependencies.init();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (e)=>ProductCubit(productUsecase: Dependencies.productManagerUsecase)),
        BlocProvider(create: (e)=>AuthCubit(loginUseCase: Dependencies.loginUsecase, registerUsecase: Dependencies.registerUsecase)),
        BlocProvider(create: (e)=>LicenceCubit(licenceUsecase: Dependencies.licenceManagerUsecase, customerslicenceUsecase: Dependencies.customerslicenceUsecase))
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

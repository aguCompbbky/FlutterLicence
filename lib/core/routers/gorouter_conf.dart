import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/features/auth/presentation/pages/auth_page.dart';
import 'package:licence/features/auth/presentation/pages/login_page.dart';
import 'package:licence/features/auth/presentation/pages/register_page.dart';
import 'package:licence/features/licenceAPI/licence/presentation/pages/add_licence_customer_page.dart';
import 'package:licence/features/licenceAPI/licence/presentation/pages/customer_licences_page.dart';
import 'package:licence/features/licenceAPI/product/presentation/pages/add_product_page.dart';
import 'package:licence/features/licenceAPI/product/presentation/pages/product_manager_page.dart';
import 'package:licence/features/licenceAPI/product/presentation/pages/update_product_page.dart';

class GoRouterConf {



  static GoRouter configRoutes(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: '/login',
              name: 'LoginPage',
              builder: (BuildContext context, GoRouterState state) {
                return const LoginPage();
              },
            ),
            GoRoute(
              path: '/register',
              name: 'RegisterPage',
              builder: (BuildContext context, GoRouterState state) {
                return const RegisterPage();
              },
            ),
            GoRoute(
              path: '/login/customer_licences_page',
              name: 'CustomerLicencesPage',
              builder: (BuildContext context, GoRouterState state) {
                return const CustomerLicencesPage();
              },
            ),
            GoRoute(
              path: '/login/customer_licences_page/add_licence_customer_page',
              name: 'AddLicenceCustomerPage',
              builder: (BuildContext context, GoRouterState state) {
                return const AddLicenceCustomerPage();
              },
            ),
            
            GoRoute(
              path: '/product_manager',
              name: 'ProductManagerPage',
              builder: (BuildContext context, GoRouterState state) {
                return const ProductManagerPage();
              },
            ),
            GoRoute(
              path: '/product_manager/add',
              name: 'ProductAddPage',
              builder: (BuildContext context, GoRouterState state) {
                return  const AddProductPage();
              },
            ),
            GoRoute(
              path: '/product_manager/update',
              name: 'ProductUpdatePage',
              builder: (BuildContext context, GoRouterState state) {
                return  const UpdateProductPage();
              },
            ),
          ],
        ),
      ],
    );

    return _router;
  }
}

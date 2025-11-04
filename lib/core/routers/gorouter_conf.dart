import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            return const ProductManagerPage();
          },
          routes: <RouteBase>[
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

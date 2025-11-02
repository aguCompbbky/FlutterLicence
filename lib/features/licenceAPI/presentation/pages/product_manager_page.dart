import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/core/extensions/string_extension.dart';
import 'package:licence/core/themes/app_theme.dart';
import 'package:licence/core/widgets/app_body_text.dart';
import 'package:licence/core/widgets/app_title_text.dart';
import 'package:licence/features/licenceAPI/bussiness/bloc/product_cubit.dart';
import 'package:licence/features/licenceAPI/bussiness/bloc/product_state.dart';

class ProductManagerPage extends StatefulWidget {
  const ProductManagerPage({super.key});

  @override
  State<ProductManagerPage> createState() => _ProductManagerPageState();
}

class _ProductManagerPageState extends State<ProductManagerPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<ProductCubit>().getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTitleText(
          TextConstants.pManagerTitleProducts,
        ),
        leading: IconButton(
          onPressed: () {
            context.read<ProductCubit>().getAllProducts();
          },
          icon: const Icon(Icons.refresh_outlined),
        ),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        builder: (context, state) {
          print(state.toString());
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductGotState) {
            return ListView.builder(
              itemCount: state.productList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: AppTitleText(state.productList[index].productName),
                    subtitle: AppBodyText(
                      'id: ${state.productList[index].id}  ${TextConstants.amount}: ${state.productList[index].productAmount}',
                    ),
                  ),
                );
              },
            );
          } else if (state is ProductGetByIdState) {

            return Card(
              child: ListTile(
                title: AppTitleText(state.product.productName),
                subtitle: AppBodyText(
                  'id: ${state.product.id}  ${TextConstants.amount}: ${state.product.productAmount}',
                ),
              ),
            );
          } else if (state is ProductErrorState) {
            return const Text('hata veriler çekilemedi');
          }

          return const SizedBox.shrink();
        }, listener: (BuildContext context, ProductState state) { },
           buildWhen: (prev, curr) => prev != curr, 
      ),
      bottomNavigationBar: _productManagerBottomBarWidget(),
    );
  }
}

class _productManagerBottomBarWidget extends StatelessWidget {
  Future<dynamic> delete(
    BuildContext context,
    void Function(String id) onDelete,
  ) {
    final TextEditingController idControllerDel = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const AppTitleText(TextConstants.pManagerBottomDeleteProduct),
        content: TextField(
          controller: idControllerDel,
          decoration: const InputDecoration(
            labelText: "ID",
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(TextConstants.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              final id = idControllerDel.text.trim();
              if (id.isNotEmpty) {
                onDelete(id);
                Navigator.of(context).pop();
              }
            },
            child: const Text(TextConstants.delete),
          ),
        ],
      ),
    );
  }

  Future<dynamic> getProduct(BuildContext context) async {
    final TextEditingController idControllerGet = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: AppTitleText("Id giriniz"),
          content: TextField(
            controller: idControllerGet,
            decoration: const InputDecoration(
              labelText: "ID",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(TextConstants.cancel),
            ),
             ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    final id = idControllerGet.text.trim();
                    if (id.isEmpty) return;

                    final productId = id.toInt();

                    context.read<ProductCubit>().getProductById(
                      productId,
                    ); 
                    Navigator.of(context).pop(); //!
                  },
                  child: const Text(TextConstants.find),
                ),
              
              
            
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onDelete(String id) async {
      await context.read<ProductCubit>().deleteProductById(id.toInt());
      await context.read<ProductCubit>().getAllProducts();
    }

    Future<void> refresh(String page) async {
      final success = await context.pushNamed(page);
      if (success == true) {
        await context.read<ProductCubit>().getAllProducts();
      }
    }

    final brand = Theme.of(
      context,
    ).extension<AppBrand>()!; //bottom button için theme

    return SafeArea(
      minimum: EdgeInsets.only(
        left: brand.spacing,
        right: brand.spacing,
        bottom: brand.spacing,
      ),

      child: Padding(
        padding: const EdgeInsets.all(8),

        child: Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () async => refresh('ProductAddPage'),
                label: const Icon(Icons.add),
              ),
            ),
            SizedBox(width: brand.spacing),
            Expanded(
              child: FilledButton.icon(
                onPressed: () async => delete(context, onDelete),
                label: const Icon(Icons.delete_outline),
              ),
            ),
            SizedBox(width: brand.spacing),
            Expanded(
              child: FilledButton.icon(
                onPressed: () => refresh('ProductUpdatePage'),
                label: const Icon(Icons.edit_outlined),
              ),
            ),
            SizedBox(width: brand.spacing),
            Expanded(
                  child: FilledButton.icon(
                    onPressed: () => getProduct(context),
                    label: const Text(
                      TextConstants.pManagerBottomGetByIdProduct,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

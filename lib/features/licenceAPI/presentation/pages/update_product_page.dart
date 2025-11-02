import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/core/extensions/string_extension.dart';
import 'package:licence/core/widgets/app_title_text.dart';
import 'package:licence/features/licenceAPI/bussiness/bloc/product_cubit.dart';
import 'package:licence/features/licenceAPI/bussiness/bloc/product_state.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController productIdController = TextEditingController();
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productAmountController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const AppTitleText(TextConstants.updateProductTitleUpdateProduct),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const AppTitleText("ID"),
                  TextFormField(
                    controller: productIdController,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 12,
                  ),
                  const AppTitleText(TextConstants.ProductName),
                  TextFormField(
                    controller: productNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 12,
                  ),
                  const AppTitleText(TextConstants.ProductAmount),
                  TextFormField(
                    controller: productAmountController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Expanded(
                child: FilledButton.icon(
                  onPressed: () async {
                    print(state.toString() +"durum");
                    await context.read<ProductCubit>().updateProduct(
                     productId:productIdController.text.toInt(),
                     productName: productNameController.text,
                     productAmount: productAmountController.text.toInt()
                     );
                     print(state.toString() +"durum");
                     context.pop(true);
                  },
                  label: const Text(TextConstants.update),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

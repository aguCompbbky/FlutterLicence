import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/core/extensions/string_extension.dart';
import 'package:licence/core/widgets/app_title_text.dart';
import 'package:licence/features/licenceAPI/product/bussiness/bloc/product_cubit.dart';
import 'package:licence/features/licenceAPI/product/bussiness/bloc/product_state.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productAmountController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const AppTitleText(TextConstants.addProductTitleAddProduct),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const AppTitleText("Product Name"),
                  TextFormField(
                    controller: productNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 12,
                  ),
                  const AppTitleText("Product Amount"),
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
                    await context.read<ProductCubit>().addProduct(
                     productName: productNameController.text,
                     productAmount: productAmountController.text.toInt()
                     );
                     context.pop(true);
                  },
                  label: const Text(TextConstants.add),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

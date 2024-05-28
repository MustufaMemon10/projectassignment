import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/common/button/sort_button.dart';
import 'package:projectassignment/src/controller/product_controller.dart';
import 'package:projectassignment/src/utils/constants/Sizes.dart';

import '../common/Layout/product_list_view.dart';
import '../controller/drop_down_controller.dart';

class ProductSearch extends StatelessWidget {
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextField(
            decoration: const InputDecoration(
              hintText: 'Search products...',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              productController.searchAndSortProducts(value);
            },
          ),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
              child: SortButton(),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Obx(() {
            return Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                        height: AppSizes.spaceBtwItems,
                      ),
                  itemCount: productController.filteredProducts.length,
                  padding: const EdgeInsets.only(
                      top: AppSizes.mdlg, bottom: AppSizes.md),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var product = productController.filteredProducts[index];
                    return VerticalProduct(
                      price: product.price.toString(),
                      title: product.title,
                      description: product.description,
                      imageUrl: product.imageUrl,
                    );
                  }),
            );
          }),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectassignment/src/common/Layout/product_list_view.dart';
import 'package:projectassignment/src/controller/product_controller.dart';

import '../utils/constants/Sizes.dart';
import '../widgets/product_heading.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({
    super.key,
  });

  final productController = ProductController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (productController.products.isEmpty) {
        return const Center(child: Text('No Data found'));
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductHeading(
            title: productController.products[0].category
                .substring(0)
                .toUpperCase(),
            // icon: Icons.menu,
            icon: Iconsax.menu,
            products: productController.products.length.toString(),
          ),
          const SizedBox(
            height: AppSizes.mdlg,
          ),

          /// Products in List
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(
                  height: AppSizes.spaceBtwItems,
                ),
                itemCount: productController.products.length,
                padding: const EdgeInsets.only(
                    top: AppSizes.mdlg, bottom: AppSizes.md),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var product = productController.products[index];
                  return VerticalProduct(
                    price: product.price.toString(),
                    title: product.title,
                    description: product.description,
                    imageUrl: product.imageUrl,
                  );
                }),
          ),
        ],
      );
    });
  }
}


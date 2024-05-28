import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:projectassignment/src/controller/product_controller.dart';
import 'package:projectassignment/src/widgets/product_heading.dart';

import '../common/Layout/product_list_view.dart';
import '../utils/constants/Sizes.dart';
import '../utils/constants/colors.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final productController = Get.put(ProductController());
  final List<String> category = [
    'Beauty',
    'Fragrances',
    'Groceries',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Category',
        style: TextStyle(
            fontSize: 20,
            color: AppColors.texColor,
            fontWeight: FontWeight.w700),
      ),
      const SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      Obx(
        () => SizedBox(
          height: 35,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: productController.categories.map((category) {
              return GestureDetector(
                onTap: () {
                  productController.changeCategory(category);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: productController.isSelected(category)
                          ? AppColors.black
                          : AppColors.lightGrey,
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextStyle(
                          color: productController.isSelected(category)
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      const SizedBox(
        height: AppSizes.spaceBtwSections,
      ),
      Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (productController.filteredProducts.isEmpty) {
          return const Center(child: Text('No Data found'));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductHeading(
              title:
                  productController.filteredProducts[0].brand.isEmpty ? productController.filteredProducts[0].category.substring(0).toUpperCase():productController.filteredProducts[0].brand,
              // icon: Icons.menu,
              icon: Iconsax.menu,
              products: productController.filteredProducts.length.toString(),
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
            ),
          ],
        );
      }),
    ]);
  }
}

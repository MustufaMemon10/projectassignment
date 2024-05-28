import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/controller/product_controller.dart';

import '../utils/constants/Sizes.dart';
import '../utils/constants/colors.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  final productController = Get.put(ProductController());

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
    ]);
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/controller/tab_controller.dart';
import 'package:projectassignment/src/widgets/categories.dart';
import 'package:projectassignment/src/widgets/search_and_sort.dart';

import '../utils/constants/Sizes.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final tabController = Get.put(TTabController());
  @override
  Widget build(BuildContext context) {
    final height = const MediaQueryData().size.height;
    final width = const MediaQueryData().size.width;
    return   Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.appBarHeight * 1.2,
            left: AppSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search bar & Sort Icon
              const SearchBarAndSortIcon(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              /// Categories
              Categories(),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              /// Product Screen
            ],
          ),
        ),
      ),
    );
  }
}

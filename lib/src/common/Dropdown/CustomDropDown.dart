import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/controller/product_controller.dart';
import 'package:projectassignment/src/screens/product_search.dart';
import '../../utils/constants/Sizes.dart';
import '../../utils/constants/colors.dart';
import 'package:projectassignment/src/controller/drop_down_controller.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key});

  final DropDownController dropDownController = Get.put(DropDownController());
  final productController = ProductController.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height ,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: AppSizes.defaultSpace,
                        left: AppSizes.defaultSpace,bottom: AppSizes.xs),
                    child: Text(
                      'Sort By',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black),
                    ),
                  ),
                  Divider(
                    color: AppColors.lightGrey,
                    thickness: 1.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.defaultSpace),
                child: Column(
                  children: dropDownController.dropDownMenuEntries
                      .map((String value) {
                    return Obx(
                      () => ListTile(
                          title: Text(value),
                          titleTextStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: dropDownController.isSelected(value)
                                  ? AppColors.black
                                  : AppColors.textSecondary),
                          onTap: () {
                            dropDownController.setSelectedValue(value);
                            productController.sortProducts();
                            Navigator.pop(context);
                          },
                          trailing: Container(
                            height: 20,
                            width: 20,
                            padding: const EdgeInsets.all(2.1),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 0.5, color: AppColors.grey)),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color:
                                    dropDownController.isSelected(value)
                                        ? AppColors.black
                                        : null,
                                shape: BoxShape.circle,
                              ),
                            ),
                          )),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

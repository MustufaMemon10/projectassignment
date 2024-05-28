import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectassignment/src/common/Dropdown/CustomDropDown.dart';
import 'package:projectassignment/src/controller/drop_down_controller.dart';

import '../../utils/constants/Sizes.dart';
import '../../utils/constants/colors.dart';


class SortButton extends StatelessWidget {
  SortButton({
    super.key,
  });

  final DropDownController dropDownController = Get.put(DropDownController());

  void _showDropDownMenu(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomDropDown(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropDownMenu(context),
      child: Container(
          padding: const EdgeInsets.all(AppSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.lightGrey,
          ),
          child: Image.asset(
            'assets/icons/Setting4-Linear-32px.png',
            height: 20,
            width: 20,
            color: AppColors.black.withOpacity(0.6),
          )),
    );
  }
}

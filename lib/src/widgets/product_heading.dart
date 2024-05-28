import 'package:flutter/material.dart';

import '../utils/constants/Sizes.dart';
import '../utils/constants/colors.dart';


class ProductHeading extends StatelessWidget {
  const ProductHeading({
    super.key, required this.icon, required this.title, required this.products,
  });
  final IconData icon;
  final String title;
  final String products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.texColor,
                ),
              ),
              Text(
                 '$products Result',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(100),
            ),
            child:  Icon(
              icon,
              color: AppColors.black.withOpacity(0.5),
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}

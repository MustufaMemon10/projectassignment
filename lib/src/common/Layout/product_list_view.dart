import 'package:flutter/material.dart';

import '../../utils/constants/Sizes.dart';
import '../../utils/constants/colors.dart';

class VerticalProduct extends StatelessWidget {
  const VerticalProduct({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.rating = '',
  });

  final String title;
  final String description;
  final String imageUrl;
  final String price;
  final String rating;

  @override
  Widget build(BuildContext context) {
    final height = const MediaQueryData().size.height;
    final width = const MediaQueryData().size.width;
    return Stack(
      children: [
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(AppSizes.smallBorderRadius),
                border: Border.all(
                    width: 1.0, color: AppColors.accent.withOpacity(0.2))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      height: 90,
                      width: 75,
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: AppSizes.md,
                  ),
                  SizedBox(
                    width: 218,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Product name
                          Text(
                            title,
                            maxLines: 1,
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: AppSizes.sm,
                          ),

                          /// Product Description
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: AppSizes.sm,
                          ),
                          Text(
                            '\$$price',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        Positioned(
            top: 8,
            right: 8,
            child: Container(
              height: 15,
              width: 43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.black),
              child: const Center(
                child: Text(
                  'Best Seller',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 6,
                      color: AppColors.light),
                ),
              ),
            )),
        Positioned(
            bottom: 15,
            right: 14,
            child: Center(
              child: Row(
                children: [
                  const Icon(Icons.star_border_outlined),
                  Text(
                    rating,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 6,
                        color: AppColors.light),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

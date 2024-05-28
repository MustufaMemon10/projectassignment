import 'package:flutter/material.dart';

import '../../utils/constants/Sizes.dart';
import '../../utils/constants/colors.dart';
class HorizontalProducts extends StatelessWidget {
  const HorizontalProducts({
    super.key, required this.title, required this.description, required this.imageUrl, required this.price,
  });
  final String title;
  final String description;
  final String imageUrl;
  final String price;
  @override
  Widget build(BuildContext context) {
          return Container(
            padding: const EdgeInsets.only(
              top: AppSizes.mdsm,
              left: AppSizes.mdsm,
              right: AppSizes.mdsm,
            ),
            decoration: BoxDecoration(
                color: AppColors.light,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    width: 1.0, color: AppColors.accent.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 7,
                    offset: const Offset(0, 2),
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    /// Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child:  Image(
                        image: NetworkImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                        height: 160,
                        width: double.infinity,
                      ),
                    ),

                    /// Tag
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.black),
                          child: const Text(
                            'Best Seller',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 6,
                                color: AppColors.light),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSizes.sm,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Title
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

                    /// Description
                    Text(
                      description,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: AppColors.grey,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: AppSizes.xs,
                    ),

                    /// Price
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
  }
}

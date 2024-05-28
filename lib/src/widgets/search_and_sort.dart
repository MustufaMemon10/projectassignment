import 'package:flutter/material.dart';

import '../common/button/sort_button.dart';
import '../utils/constants/Sizes.dart';
import '../utils/constants/colors.dart';

class SearchBarAndSortIcon extends StatelessWidget {
   const SearchBarAndSortIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.defaultSpace),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.circular(46.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 15.0,),
                    hintText: 'Search...',
                    prefixIcon: Image.asset(
                      'assets/icons/search.png',
                      color: AppColors.black.withOpacity(0.6),
                    ),
                    hintStyle:  TextStyle(
                      fontSize: 14, color: AppColors.black.withOpacity(0.4),
                    ),
                    border: InputBorder.none,
                    suffixIcon: Image.asset(
                      'assets/icons/search zoom.png',
                      color: AppColors.black.withOpacity(0.6),
                    )),
              ),
            ),
          ),
          const SizedBox(
            width: AppSizes.sm,
          ),
          SortButton(),
        ],
      ),
    );
  }
}


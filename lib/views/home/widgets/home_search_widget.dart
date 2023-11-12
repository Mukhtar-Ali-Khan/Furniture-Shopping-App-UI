import 'package:flutter/material.dart';

import '../../../res/assets/app_assets.dart';
import '../../../res/colors/app_colors.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: const Offset(-2.0, -2.0),
          ),
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: const Offset(2.0, 2.0),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            prefixIcon: Image.asset(
              AppAssets.searchIcon,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
      ),
    );
  }
}

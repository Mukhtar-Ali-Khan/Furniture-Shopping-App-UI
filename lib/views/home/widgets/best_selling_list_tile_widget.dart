import 'package:flutter/material.dart';

import '../../../res/assets/app_assets.dart';
import '../../../res/colors/app_colors.dart';

class BestSellingListTileWidget extends StatelessWidget {
  const BestSellingListTileWidget({
    Key? key,
    required this.productName,
    required this.asset,
    required this.price,
    required this.onTap,
  }) : super(key: key);
  final String productName;
  final String asset;
  final String price;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(18),
      width: size.width * 0.83,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              asset,
              height: 75,
              width: 75,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                productName,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                'Description',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 8),
              Text(
                '\$$price',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

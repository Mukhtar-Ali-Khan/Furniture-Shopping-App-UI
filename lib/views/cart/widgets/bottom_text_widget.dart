import 'package:flutter/material.dart';
import 'package:furniture_shopping_app_ui/res/components/dummy_product_lists.dart';
import 'package:furniture_shopping_app_ui/utils/utils.dart';

import '../../../res/colors/app_colors.dart';

class BottomTextWidget extends StatelessWidget {
  const BottomTextWidget(
      {Key? key,
      required this.price,
      required this.leadingText,
      required this.isSubT})
      : super(key: key);
  final String leadingText;
  final String price;
  final bool isSubT;

  @override
  Widget build(BuildContext context) {
    var newPrice = DummyProductList.cartList.isEmpty ? '00.0': price;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingText,
          style: isSubT
              ? Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.buttonColor)
              : Theme.of(context).textTheme.titleMedium,
        ),
        Text('\$$newPrice',
            style: isSubT
                ? Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.lightRed)
                : Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.lightRed, fontSize: 18))
      ],
    );
  }
}

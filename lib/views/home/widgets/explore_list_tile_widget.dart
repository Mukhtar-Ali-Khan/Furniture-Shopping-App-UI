import 'package:flutter/material.dart';
import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import '../../../res/colors/app_colors.dart';
import '../../../utils/utils.dart';

class ExploreListTileWidget extends StatelessWidget {
  const ExploreListTileWidget({
    Key? key,
    required this.productModel,
    required this.onTap,
  }) : super(key: key);
  final ProductModel productModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: 180,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: onTap,
                  child: AspectRatio(
                    aspectRatio: 3 / 3.5,
                    child: Image.asset(
                      productModel.productImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: 14,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          spreadRadius: 3.0,
                          blurRadius: 5.0,
                        )
                      ],
                    ),
                    child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            productModel.productName,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 3),
          Text(
            'Description',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${productModel.price}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              InkWell(
                onTap: () {
                  var isAdded = Utils.addToCart(productModel);
                  if (isAdded) {
                    Utils.toastMessage();
                  } else {
                    Utils.toastMessage(message: 'Cant add to Cart');
                  }
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.buttonColor,
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: AppColors.whiteColor,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

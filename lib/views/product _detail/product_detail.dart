import 'package:flutter/material.dart';
import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import 'package:furniture_shopping_app_ui/res/colors/app_colors.dart';
import 'package:furniture_shopping_app_ui/res/components/app_bar_widget.dart';
import 'package:furniture_shopping_app_ui/utils/utils.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.productModel}) : super(key: key);

  final ProductModel productModel;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height * 0.5,
                width: size.width,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(horizontal: 22)
                    .copyWith(top: size.height * 0.06),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(70),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.productModel.productImage),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const AppBarWidget(title: 'Product'),
              ),
              Positioned(
                bottom: -25,
                right: 20,
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
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
                    size: 28,
                    color: AppColors.redColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              '\$${widget.productModel.price}',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.redColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  widget.productModel.productName,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacer(),
                for (int i = 1; i <= 5; i++)
                  Icon(
                    i != 5 ? Icons.star_sharp : Icons.star_border,
                    color: AppColors.orangeColor,
                  ),
                const SizedBox(width: 4),
                Text(
                  '4.5',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Color Option',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: getColors(),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Description',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                var isAdded = Utils.addToCart(widget.productModel);
                if (isAdded) {
                  Utils.toastMessage();
                } else {
                  Utils.toastMessage(message: 'Cant add to Cart');
                }
              },
              child: Container(
                height: 65,
                width: size.width * 0.55,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(70),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 29,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Add to Cart',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getColors() {
    return List.generate(
      colorList.length,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: Icon(
                Icons.circle,
                color: colorList[index],
                size: selectedColor == index ? 20 : 30,
              ),
            ),
            Visibility(
              visible: selectedColor == index,
              child: Icon(
                Icons.circle_outlined,
                color: colorList[index],
                size: 36,
              ),
            )
          ],
        ),
      ),
    ).toList();
  }

  List<Color> colorList = <Color>[
    AppColors.grayColor,
    AppColors.redColor,
    AppColors.buttonColor
  ];
}

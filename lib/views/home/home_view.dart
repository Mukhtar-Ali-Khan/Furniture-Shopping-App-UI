import 'package:flutter/material.dart';
import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import 'package:furniture_shopping_app_ui/res/assets/app_assets.dart';
import 'package:furniture_shopping_app_ui/res/colors/app_colors.dart';
import 'package:furniture_shopping_app_ui/res/components/dummy_product_lists.dart';
import 'package:furniture_shopping_app_ui/views/home/widgets/best_selling_list_tile_widget.dart';
import 'package:furniture_shopping_app_ui/views/home/widgets/explore_list_tile_widget.dart';
import 'package:furniture_shopping_app_ui/views/home/widgets/home_search_widget.dart';
import 'package:furniture_shopping_app_ui/views/home/widgets/shopping_card_widget.dart';
import 'package:furniture_shopping_app_ui/views/product%20_detail/product_detail.dart';

import '../cart/cart_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppAssets.menuIcon,
                      width: 45,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person,
                        color: AppColors.whiteColor,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 35),
              // search and card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: HomeSearchWidget(),
                    ),
                    const SizedBox(width: 34),
                    ShoppingCardWidget(onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartView()));
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Explore',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  height: 320,
                  child: ListView.separated(
                    itemCount: DummyProductList.exploreList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (context, child) =>
                        const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      var product = DummyProductList.exploreList[index];
                      return ExploreListTileWidget(
                        productModel : product,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                productModel: product,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Best Selling',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              //Best selling section
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  height: 134,
                  child: ListView.separated(
                    itemCount: DummyProductList.bestSellingList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    separatorBuilder: (context, child) =>
                        const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      var product = DummyProductList.bestSellingList[index];
                      return BestSellingListTileWidget(
                        price: product.price,
                        productName: product.productName,
                        asset: product.productImage,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                productModel: product,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

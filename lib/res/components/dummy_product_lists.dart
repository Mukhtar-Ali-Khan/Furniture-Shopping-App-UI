import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import 'package:furniture_shopping_app_ui/res/assets/app_assets.dart';

class DummyProductList {
  static List<ProductModel> exploreList = <ProductModel>[
    ProductModel(
        productImage: AppAssets.product1,
        productName: 'Mini white chair',
        price: '350.00'),
    ProductModel(
        productImage: AppAssets.product2,
        productName: 'Mini white chair',
        price: '250.00'),
    ProductModel(
        productImage: AppAssets.product3,
        productName: 'Mini white chair',
        price: '220.00'),
    ProductModel(
        productImage: AppAssets.product4,
        productName: 'Mini white chair',
        price: '450.00'),
  ];

  static List<ProductModel> bestSellingList = <ProductModel>[
    ProductModel(
        productImage: AppAssets.product4,
        productName: 'elegant chair',
        price: '350.00'),
    ProductModel(
        productImage: AppAssets.product5,
        productName: 'Minimal chair',
        price: '250.00'),
    ProductModel(
        productImage: AppAssets.product6,
        productName: 'black chair',
        price: '220.00'),
    ProductModel(
        productImage: AppAssets.product7,
        productName: 'Mini chair',
        price: '450.00'),
  ];

  static List<ProductModel> cartList = <ProductModel>[];
}

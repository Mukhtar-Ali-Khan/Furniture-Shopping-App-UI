import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import 'package:furniture_shopping_app_ui/res/components/dummy_product_lists.dart';

class Utils {
  static bool addToCart(ProductModel productModel) {
    DummyProductList.cartList.add(productModel);
    return DummyProductList.cartList.contains(productModel);
  }

  static toastMessage({String message = 'Added to Cart!'}) {
    Fluttertoast.showToast(msg: message);
  }
}

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app_ui/models/product/product_model.dart';
import 'package:furniture_shopping_app_ui/view_models/cart/cart_view_model.dart';
import '../../../res/colors/app_colors.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    Key? key,
    required this.productModel,
    required this.index,
  }) : super(key: key);
  final ProductModel productModel;
  final int index;

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final cartVM = CartViewModel();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      width: size.width,
      child: Row(
        children: [
          Checkbox(
              value: cartVM.selectedItems.containsKey(widget.index),
              checkColor: AppColors.whiteColor,
              activeColor: AppColors.lightRed,
              onChanged: (value) {
                if (cartVM.selectedItems.containsKey(widget.index)) {
                  setState(() {
                    cartVM.selectedItems.remove(widget.index);
                  });
                } else {
                  setState(() {
                    cartVM.selectedItems.addAll({widget.index: 1});
                  });
                }
              }),
          const SizedBox(width: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              widget.productModel.productImage,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.productModel.productName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${widget.productModel.price}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.lightRed)),
                    Container(
                      width: 90,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: AppColors.grayColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                cartVM.selectedItems.update(widget.index,
                                    (value) => value > 1 ? value - 1 : value);
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 20,
                            ),
                          ),
                          Text(
                            cartVM.selectedItems[widget.index] != null
                                ? cartVM.selectedItems[widget.index].toString()
                                : '0',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                cartVM.selectedItems
                                    .update(widget.index, (value) => value + 1);
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

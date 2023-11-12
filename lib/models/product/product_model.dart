class ProductModel {
  String productName;
  String? description;
  String productImage;
  String price;

  ProductModel({
    required this.productName,
    required this.productImage,
    this.description,
    required this.price,
  });
}

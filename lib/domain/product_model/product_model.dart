class ProductModel {
  ProductModel(
      {required this.productName,
      required this.realPrice,
      required this.offerPercentage,
      required this.description,
      required this.brand,
      required this.imageUrl});

  String productName;
  String realPrice;
  String offerPercentage;
  String description;
  String brand;
  String imageUrl;

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'realPrice': realPrice,
        'offerPercentage': offerPercentage,
        'description': description,
        'brand': brand,
        'image': imageUrl
      };
}

class ProductModel {
  ProductModel(
      {required this.productName,
      required this.realPrice,
      required this.offerPrice,
      required this.offerPercentage,
      required this.description,
      required this.brand,
      required this.imageUrl1,
      required this.imageUrl2,
      required this.imageUrl3,required this.productSize});

  String productName;
  String realPrice;
  String offerPrice;
  String offerPercentage;
  String description;
  String brand;
  String imageUrl1;
  String imageUrl2;
  String imageUrl3;
  Map<String, String> productSize;

  Map<String, dynamic> toJson() => {
        'productName': productName,
        'realPrice': realPrice,
        'offerPrice': offerPrice,
        'offerPercentage': offerPercentage,
        'description': description,
        'brand': brand,
        'image1': imageUrl1,
        'image2': imageUrl2,
        'image3': imageUrl3,
        'productSize':productSize,
      };
}

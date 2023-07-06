class BrandModel {
  BrandModel({required this.brandName, required this.imageUrl});
  String brandName;
  String imageUrl;

  Map<String, dynamic> toJson() => {
        'brandName': brandName,
        'image': imageUrl,
      };

  static BrandModel fromJson(Map<String, dynamic> json) => BrandModel(
        brandName: json['brandName'],
        imageUrl: json['image'],
      );
}


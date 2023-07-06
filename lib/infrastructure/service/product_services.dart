import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sole_sphere_admin/domain/product_model/product_model.dart';

class ProductServices {
  Future<String> uploadImg(XFile image) async {
    try {
      final path = 'files/${image.name}';
      final file = File(image.path);
      final ref = FirebaseStorage.instance.ref().child(path);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      return urlDownload;
    } catch (error) {
      return '';
    }
  }

  Future addProduct(
      {required String imageUrl1,
      required String imageUrl2,
      required String imageUrl3,
      required String productName,
      required String realPrice,
      required String offerPercentage,
      required String description,
      required String brand,
      required String offerPrice,
      required Map<String, String> productSize}) async {
    final collectionref =
        FirebaseFirestore.instance.collection('solesphere').doc('admin').collection('products');
    final docRef = collectionref.doc(productName);
    final product = ProductModel(
        productName: productName,
        realPrice: realPrice,
        offerPercentage: offerPercentage,
        description: description,
        brand: brand,
        imageUrl1: imageUrl1,
        imageUrl2: imageUrl2,
        imageUrl3: imageUrl3,
        offerPrice: offerPrice,
        productSize: productSize);
    final json = product.toJson();
    await docRef.set(json);
  }

  Future<int> offerPriceCalculator(
      {required String realPrice, required String offerPercentage}) async {
    int realPriceInt = int.parse(realPrice);
    log('real price : $realPriceInt');
    int offerPercentageInt = int.parse(offerPercentage);
    log('offer percentage : $offerPercentageInt');

    int offerPriceInt = ((offerPercentageInt / 100) * realPriceInt).round();
    log('offer price  : $offerPriceInt');

    log(offerPriceInt.toString());

    log('return price : ${realPriceInt - offerPriceInt}');

    return realPriceInt - offerPriceInt;
  }
}

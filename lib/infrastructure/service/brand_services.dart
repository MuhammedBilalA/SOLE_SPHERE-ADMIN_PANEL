import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sole_sphere_admin/domain/brand_model/brand_model.dart';

class BrandServices {
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

  Future addBrand(String imageUrl, String brandName) async {
    final collectionref =
        FirebaseFirestore.instance.collection('solesphere').doc('admin').collection('brands');
    final docRef = collectionref.doc(brandName);
    final brand = BrandModel(brandName: brandName, imageUrl: imageUrl);
    final json = brand.toJson();
    await docRef.set(json);
  }

  Future<List<BrandModel>> getBrand() async {
    List<BrandModel> brandList = [];
    final querySnapshot = await FirebaseFirestore.instance
        .collection('solesphere')
        .doc('admin')
        .collection('brands')
        .get();

    List data = querySnapshot.docs;

    for (var element in data) {
      BrandModel model = BrandModel(brandName: element['brandName'], imageUrl: element['image']);
      brandList.add(model);
  
    }
    return brandList;
  }
}

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/infrastructure/add_brand_functions/add_brand_function.dart';
import 'package:sole_sphere_admin/presentation/all_brands_screens/all_brands_screen.dart';

class AddBrandsScreen extends StatefulWidget {
  AddBrandsScreen({super.key});

  @override
  State<AddBrandsScreen> createState() => _AddBrandsScreenState();
}

class _AddBrandsScreenState extends State<AddBrandsScreen> {
  String imagePath = 'x';
  final formkey = GlobalKey<FormState>();

  TextEditingController brandNameControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kwhite,
            )),
        // elevation: 2,
        centerTitle: true,
        title: const Text(
          'ADD BRANDS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 300,
                color: (imagePath == 'x') ? const Color(0xFF2C2B2B) : kwhite,
                child: (imagePath == 'x')
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  imagePath = pickedFile.path;
                                });
                              }
                            },
                            child: const Text(
                              "Add Image",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: kwhite),
                            ),
                          ),
                          const Icon(
                            Icons.add_a_photo_outlined,
                            color: kwhite,
                            size: 28,
                          )
                        ],
                      )
                    : Center(
                        child: SizedBox(
                          // color: Colors.red,
                          height: 250,
                          width: 250,
                          child: Image(
                            image: FileImage(File(
                              imagePath,
                            )),
                          ),
                        ),
                      )),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: formkey,
              child: TextFormField(
                style: const TextStyle(color: kwhite),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the brand name';
                  }
                  return null;
                },
                controller: brandNameControllor,
                cursorColor: kwhite,
                decoration: InputDecoration(
                  label: const Text(
                    'Brand Name',
                    style: TextStyle(color: kwhite),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: kwhite,
                      // width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: kwhite,
                      // width: 2.0,
                    ),
                  ),
                  hintText: '  enter brand name',
                  hintStyle: const TextStyle(color: kwhite),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: kwhite,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(73, 73, 73, 1))),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Brand brand = Brand(
                        brandImage: imagePath,
                        brandName: brandNameControllor.text);

                    brandList.add(brand);
                    log(imagePath);
                    log(brandNameControllor.text);
                    brandNameControllor.clear();
                    imagePath = 'x';

                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                          behavior: SnackBarBehavior.floating,
                          width: 250,
                          duration: const Duration(seconds: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.green,
                          content: const Center(child: Text('gigiggigigi'))));
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Brand '))
          ],
        ),
      ),
    );
  }
}

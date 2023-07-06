import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_brand/add_brand_image_notifier.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/infrastructure/add_brand_functions/add_brand_function.dart';
import 'package:sole_sphere_admin/infrastructure/service/brand_services.dart';
import 'package:sole_sphere_admin/widgets/snackbar.dart';

class AddBrandsScreen extends StatelessWidget {
  AddBrandsScreen({super.key});

  // String imagePath = 'x';

  final formkey = GlobalKey<FormState>();
  XFile? pickedFile;

  TextEditingController brandNameControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddBrandImageNotifier>(context, listen: false);
    log('buildment');
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
            Consumer<AddBrandImageNotifier>(builder: (context, value, child) {
              return Container(
                  width: double.infinity,
                  height: 300,
                  color: (value.imagePath == 'x') ? const Color(0xFF2C2B2B) : kwhite,
                  child: (value.imagePath == 'x')
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                pickedFile =
                                    await ImagePicker().pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  // setState(() {
                                  controller.getImage(pickedFile!.path);
                                  // imagePath = pickedFile.path;
                                  // });
                                }
                              },
                              child: const Text(
                                "Add Image",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18, color: kwhite),
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
                                value.imagePath,
                              )),
                            ),
                          ),
                        ));
            }),
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
                    backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(73, 73, 73, 1))),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    if (controller.imagePath == 'x' && pickedFile == null) {
                      snackbarFailed(text: 'Image is requiered', context: context);
                    } else {
                      log('1');

                      await addBrand();

                      log('2');

                      // Brand brand = Brand(
                      //     brandImage: controller.imagePath, brandName: brandNameControllor.text);

                      // brandList.add(brand);
                      snackbarSuccess(
                          text: '${brandNameControllor.text} Brand added Successfully',
                          context: context);
                      // log(c);
                      // log(brandNameControllor.text);
                      brandNameControllor.clear();
                      controller.imagePath = 'x';

                      Navigator.pop(context);
                    }
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Brand '))
          ],
        ),
      ),
    );
  }

  Future<void> addBrand() async {
    if (pickedFile == null) {
      log('picknull');
    }

    final downloadImageUrl = await BrandServices().uploadImg(pickedFile!);
    log('4');

    await BrandServices().addBrand(downloadImageUrl, brandNameControllor.text);
    log('5');
  }
}

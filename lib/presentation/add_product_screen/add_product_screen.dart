import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/brand_selection_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/image_add_notifier.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/title_text_formfield.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  // String? selectedOption;
  List<String> options = [
    'NIKE',
    'ADDIDAS',
    'PUMA',
    'BATA',
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BrandSelectionNotifier>(context, listen: false);
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
          'ADD PRODUCT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ChangeNotifierProvider(
                create: (context) => ImageAddNotifier(),
                child: Consumer<ImageAddNotifier>(
                  builder: (context, imageController, child) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          color: const Color(0xFF2C2B2B),
                          child: imageController.selectedIndex == null
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add Image",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 18, color: kwhite),
                                    ),
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      color: kwhite,
                                      size: 28,
                                    )
                                  ],
                                )
                              : Image.file(
                                  File(imageController.imageList[imageController.selectedIndex!]),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () async {
                                          if (index == (imageController.imageList.length)) {
                                            final pickedFile = await ImagePicker()
                                                .pickImage(source: ImageSource.gallery);
                                            if (pickedFile != null) {
                                              imageController.imageAdd(
                                                  imagePath: pickedFile.path, index: index);
                                            }
                                          } else {
                                            imageController.changeIndex(index: index);
                                          }
                                        },
                                        child: Center(
                                          child: index == imageController.imageList.length
                                              ? Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(50),
                                                      color: const Color(0xFF2C2B2B)),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.add_a_photo_outlined,
                                                      color: kwhite,
                                                    ),
                                                  ),
                                                )
                                              : CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: FileImage(
                                                    File(imageController.imageList[index]),
                                                  ),
                                                ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) => SizedBox(
                                        width: 20,
                                      ),
                                  itemCount: imageController.imageList.length < 3
                                      ? imageController.imageList.length + 1
                                      : 3)
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TitleTexFormField(title: 'Product Name', height: 60, inputType: TextInputType.name),
              TitleTexFormField(title: 'Real Price', height: 60, inputType: TextInputType.number),
              TitleTexFormField(
                  title: 'Offer Percentage', height: 60, inputType: TextInputType.number),
              TitleTexFormField(title: 'Inventory', height: 60, inputType: TextInputType.number),
              TitleTexFormField(title: 'Discription', height: 150, inputType: TextInputType.name),
              const Text(
                'Brand',
                style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: Consumer<BrandSelectionNotifier>(builder: (context, data, child) {
                  return DropdownButtonFormField(
                    decoration: InputDecoration(
                        hintText: ' Select Brand',
                        hintStyle: const TextStyle(color: kwhite),
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
                        disabledBorder:
                            const UnderlineInputBorder(borderSide: BorderSide(color: kwhite))),
                    focusColor: kwhite,
                    dropdownColor: const Color(0xFF2C2B2B),
                    style: const TextStyle(color: kwhite),
                    value: data.selectedOption,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: kwhite,
                      // size: 40,
                    ),
                    iconSize: 25,
                    elevation: 16,
                    onChanged: (newValue) {
                      // setState(() {
                      controller.getBrand(newValue);
                      // selectedOption = newValue;
                      // });
                    },
                    items: options.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  );
                }),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 3, 59, 15))),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Product '))
            ],
          ),
        ),
      ),
    );
  }
}

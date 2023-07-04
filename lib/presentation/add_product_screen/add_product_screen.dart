import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/add_size_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/brand_selection_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/image_add_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/size_builder.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/size_count_widget.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/title_text_formfield.dart';
import 'package:sole_sphere_admin/widgets/snackbar.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  // String? selectedOption;
  final List<String> options = [
    'NIKE',
    'ADDIDAS',
    'PUMA',
    'BATA',
  ];

  @override
  Widget build(BuildContext context) {
    final brandSelectionController = Provider.of<BrandSelectionNotifier>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => SizeBuilder(),
      child: Scaffold(
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: kwhite),
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
                                    separatorBuilder: (context, index) => const SizedBox(
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
                        brandSelectionController.getBrand(newValue);
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
                  height: 20,
                ),
                const Text(
                  'Size',
                  style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                //-------------------My code-----------------------
                Consumer<SizeBuilder>(builder: (context, sizebuilder, child) {
                  List keys = sizebuilder.sizeQuantityMap.keys.toList();
                  return Column(
                    children: [
                      sizebuilder.sizeQuantityMap.isNotEmpty
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Size',
                                  style: TextStyle(color: kwhite),
                                ),
                                Text(
                                  'Qty',
                                  style: TextStyle(color: kwhite),
                                )
                              ],
                            )
                          : const SizedBox(),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              // color: kred,
                              height: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    keys[index],
                                    style: const TextStyle(color: kwhite),
                                  ),
                                  Text(
                                    sizebuilder.sizeQuantityMap[keys[index]]!,
                                    style: const TextStyle(color: kwhite),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: sizebuilder.sizeQuantityMap.length),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Color.fromARGB(255, 3, 59, 15))),
                              onPressed: () {
                                addSizeDialog(context, sizebuilder);
                              },
                              icon: const Icon(Icons.add),
                              label: const Text('Add Size')),
                          ElevatedButton.icon(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Color.fromARGB(255, 3, 59, 15))),
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: const Text('Save Product')),
                        ],
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addSizeDialog(BuildContext context, SizeBuilder sizebuilder) {
    return showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddSizeNotifier(),
        child: AlertDialog(
          title: const Center(child: Text('Add size and quantity')),
          content: Consumer<AddSizeNotifier>(builder: (context, sizeAndCountcontroller, child) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('SIZE'),
                        SizeCountWidget(size: sizeAndCountcontroller.size, issize: true),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('COUNT'),
                        SizeCountWidget(size: sizeAndCountcontroller.quantity, issize: false),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (sizeAndCountcontroller.size > 0 && sizeAndCountcontroller.quantity > 0) {
                        sizebuilder.addingSize(
                            size: sizeAndCountcontroller.size.toString(),
                            quantity: sizeAndCountcontroller.quantity.toString());
                        Navigator.of(context).pop();
                      } else {
                        //log('not null');
                        Navigator.pop(context);
                        snackbarFailed(text: "Size and Quandity Can't be 0", context: context);
                      }
                    },
                    child: const Text('Add Size'))
              ],
            );
          }),
        ),
      ),
    );
  }
}

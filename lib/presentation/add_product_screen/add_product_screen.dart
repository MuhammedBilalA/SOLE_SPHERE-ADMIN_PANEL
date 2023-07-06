import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/add_size_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/brand_selection_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/image_add_notifier.dart';
import 'package:sole_sphere_admin/application/add_product/size_builder.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/domain/brand_model/brand_model.dart';
import 'package:sole_sphere_admin/infrastructure/service/product_services.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/size_count_widget.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/widgets/title_text_formfield.dart';
import 'package:sole_sphere_admin/presentation/home_screens/home_screen.dart';
import 'package:sole_sphere_admin/widgets/question_popup.dart';
import 'package:sole_sphere_admin/widgets/snackbar.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key, required this.options});

  final List<BrandModel> options;

  final productNameController = TextEditingController();
  final realPriceController = TextEditingController();
  final offerPercentageController = TextEditingController();
  final discriptionController = TextEditingController();
  XFile? image1;
  XFile? image2;
  XFile? image3;
  String? selectedBrand = 'x';
  final formkey = GlobalKey<FormState>();

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
            child: Form(
              key: formkey,
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
                              color: imageController.selectedIndex == null
                                  ? const Color(0xFF2C2B2B)
                                  : kwhite,
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
                                  : Center(
                                      child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Image.file(
                                          File(imageController
                                              .imageList[imageController.selectedIndex!]),
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
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
                                                  if (index == 0) {
                                                    image1 = pickedFile;
                                                  } else if (index == 1) {
                                                    image2 = pickedFile;
                                                  } else if (index == 2) {
                                                    image3 = pickedFile;
                                                  }
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
                  TitleTexFormField(
                      title: 'Product Name',
                      height: 80,
                      inputType: TextInputType.name,
                      textEditingController: productNameController),
                  TitleTexFormField(
                      title: 'Real Price',
                      height: 80,
                      inputType: TextInputType.number,
                      textEditingController: realPriceController),
                  TitleTexFormField(
                      title: 'Offer Percentage',
                      maxLength: 2,
                      height: 80,
                      inputType: TextInputType.number,
                      textEditingController: offerPercentageController),
                  TitleTexFormField(
                      title: 'Description',
                      height: 180,
                      inputType: TextInputType.name,
                      textEditingController: discriptionController),
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
                          selectedBrand = newValue;

                          // selectedOption = newValue;
                          // });
                        },
                        items: options.map<DropdownMenuItem<String>>((BrandModel value) {
                          return DropdownMenuItem<String>(
                            value: value.brandName,
                            child: Text(value.brandName),
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
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    if (image1 == null || image2 == null || image3 == null) {
                                      snackbarFailed(text: '3 images required', context: context);
                                    } else if (selectedBrand == null || selectedBrand == 'x') {
                                      snackbarFailed(
                                          text: 'please select a brand', context: context);
                                    } else if (sizebuilder.sizeQuantityMap.isEmpty) {
                                      snackbarFailed(text: 'Size is requiered', context: context);
                                    } else {
                                      loadingPopUp(context);
                                      await productAddingFunction(
                                          productSize: sizebuilder.sizeQuantityMap);
                                      snackbarSuccess(
                                          text: 'Product added Successfully', context: context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    }
                                  }
                                  log(sizebuilder.sizeQuantityMap.toString());
                                },
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
      ),
    );
  }

  Future<void> productAddingFunction({required Map<String, String> productSize}) async {
    if (image1 == null) {
      log('image1 is null');
    }

    int offerPrice = await ProductServices().offerPriceCalculator(
        realPrice: realPriceController.text, offerPercentage: offerPercentageController.text);

    final downloadImageUrl1 = await ProductServices().uploadImg(image1!);
    final downloadImageUrl2 = await ProductServices().uploadImg(image2!);
    final downloadImageUrl3 = await ProductServices().uploadImg(image3!);
    log('4');

    await ProductServices().addProduct(
        imageUrl1: downloadImageUrl1,
        imageUrl2: downloadImageUrl2,
        imageUrl3: downloadImageUrl3,
        productName: productNameController.text,
        realPrice: realPriceController.text,
        offerPercentage: offerPercentageController.text,
        description: discriptionController.text,
        brand: selectedBrand!,
        productSize: productSize,
        offerPrice: offerPrice.toString());
    log('5');
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
                      if ((sizebuilder.sizeQuantityMap
                          .containsKey(sizeAndCountcontroller.size.toString()))) {
                        snackbarFailed(text: 'Size is alredy added', context: context);
                      } else if (sizeAndCountcontroller.size > 0 &&
                          sizeAndCountcontroller.quantity > 0) {
                        sizebuilder.addingSize(
                            size: sizeAndCountcontroller.size.toString(),
                            quantity: sizeAndCountcontroller.quantity.toString());
                        Navigator.of(context).pop();
                        //log('not null');
                      } else {
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

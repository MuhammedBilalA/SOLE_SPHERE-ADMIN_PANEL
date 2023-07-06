import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/product_details_size.dart';

import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_product_screens/widgets/size_tile.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen(
      {super.key,
      required this.productName,
      required this.offerPercentage,
      required this.realPrice,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.offerPrice,
      required this.brand,
      required this.productDescription,
      required this.sizeDetails});

  String brand;
  String productName;
  String offerPercentage;
  String offerPrice;
  String realPrice;
  Map<String, dynamic> sizeDetails;
  String productDescription;
  String image1;
  String image2;
  String image3;

  @override
  Widget build(BuildContext context) {
    List<String> availableSize = [];
    availableSize.addAll(sizeDetails.keys);
    List<dynamic> availableQuandity = [];
    availableQuandity.addAll(sizeDetails.values);
    List<String> imageList = [image1, image2, image3];
    SizeController sizeinitialController = Provider.of<SizeController>(context, listen: false);
    sizeinitialController.quandity = availableQuandity[0];
    sizeinitialController.index = 0;

    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kblack,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: kblack,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.73,
              // color: kred,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: kwhite,
                      child: Center(
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          ),
                          itemCount: imageList.length,
                          itemBuilder: (context, index, realIndex) => Container(
                            height: 200,
                            width: 200,
                            // color: kblack,
                            child: Image(image: NetworkImage(imageList[index])),
                          ),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Container(
                        // color: kred,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                          child: Text(
                            productName,
                            style: TextStyle(
                                color: kwhite,
                                overflow: TextOverflow.clip,
                                fontSize: 23,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        // color: kred,
                        child: Row(
                          children: [
                            Text(
                              '-$offerPercentage% off',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 4, 4),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              '₹ $offerPrice.00',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 34),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 26),
                            ),
                            Spacer(
                              flex: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'M.R.P. : ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 193, 189, 189),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          Text(
                            '₹$realPrice.00',
                            style: TextStyle(
                                color: Color.fromARGB(255, 193, 189, 189),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: kred,
                                decorationThickness: 1.8,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10),
                      child: Consumer<SizeController>(builder: (context, quandityDisplay, child) {
                        return Text(
                          'Only ${quandityDisplay.quandity} left in stock',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 47, 47),
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,
                        // color: kred,
                        child: Text(
                          "$productDescription",
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: Color.fromARGB(255, 193, 192, 192),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 15),
                      child: Text(
                        'Select the size',
                        style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 85,
                      width: double.infinity,
                      // color: kred,
                      child: Center(
                        child: Consumer<SizeController>(builder: (context, value, child) {
                          return ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    log('message');
                                  },
                                  child: SizeTile(
                                    size: availableSize[index],
                                    availableQuandity: availableQuandity,
                                    index: index,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: sizeDetails.length);
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //next section for the payment and add to cart
          ],
        ),
      ),
    );
  }
}

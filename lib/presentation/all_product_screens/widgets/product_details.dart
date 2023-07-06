import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/product_details_size.dart';

import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_product_screens/widgets/size_tile.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});

 final List<String> imageList = [
    'assets/images/shoe2.png',
    'assets/images/shoe4.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          ),
                          itemCount: imageList.length,
                          itemBuilder: (context, index, realIndex) => Container(
                            height: 200,
                            width: 200,
                            // color: kblack,
                            child: Image.asset(imageList[index]),
                          ),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Container(
                        // color: kred,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                          child: Text(
                            "Nike Air Jordhan",
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
                        child: const Row(
                          children: [
                            Text(
                              '-85% off',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 4, 4),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Text(
                              '₹ 3,544.00',
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
                    const Padding(
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
                            '₹4,599.00',
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
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10),
                      child: Text(
                        'Only 2 left in stock',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 47, 47),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        // height: double.infinity,
                        // color: kred,
                        child: const Text(
                          "dable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the lik",
                          style: TextStyle(
                              overflow: TextOverflow.fade,
                              color: Color.fromARGB(255, 193, 192, 192),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    // Wrap(
                    //   spacing: 5.0,
                    //   children: List<Widget>.generate(
                    //     3,
                    //     (int index) {
                    //       return Transform(
                    //         transform: new Matrix4.identity()..scale(.99),
                    //         child: ChoiceChip(
                    //           shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(100)),
                    //           label: Text('4$index'),
                    //           selected: _value == index,
                    //           selectedColor: kred,
                    //           onSelected: (bool selected) {
                    //             setState(() {
                    //               _value = selected ? index : null;
                    //             });
                    //           },
                    //         ),
                    //       );
                    //     },
                    //   ).toList(),
                    // ),
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
                        child: ChangeNotifierProvider(
                            create: (context) => SizeController(),
                            child: Consumer(builder: (context, value, child) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {},
                                      child: SizeTile(
                                        index: index,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  },
                                  itemCount: 5);
                            })),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_product_screens/widgets/product_details.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kwhite,
            )),
        // elevation: 2,
        centerTitle: true,
        title: const Text(
          'ALL PRODUCT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 5, right: 5),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('solesphere')
                .doc('admin')
                .collection('products')
                .snapshots(),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 269,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                brand: snapshot.data!.docs[index]['brand'],
                                image1: snapshot.data!.docs[index]['image1'],
                                image2: snapshot.data!.docs[index]['image2'],
                                image3: snapshot.data!.docs[index]['image3'],
                                offerPercentage: snapshot.data!.docs[index]['offerPercentage'],
                                offerPrice: snapshot.data!.docs[index]['offerPrice'],
                                productDescription: snapshot.data!.docs[index]['description'],
                                productName: snapshot.data!.docs[index]['productName'],
                                realPrice: snapshot.data!.docs[index]['realPrice'],
                                sizeDetails: snapshot.data!.docs[index]['productSize'],
                              ),
                            ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: kwhite, borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 8, right: 3),
                                  child: PopupMenuButton(
                                      onSelected: (value) {
                                        if (value == 0) {
                                        } else {}
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15)),
                                      iconSize: 28,
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem(
                                              value: 0,
                                              child: Row(
                                                children: [
                                                  Icon(Icons.edit),
                                                  Text('   Edit'),
                                                  Spacer(
                                                    flex: 3,
                                                  )
                                                ],
                                              )),
                                          PopupMenuItem(
                                              value: 1,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                  Text('   Delete'),
                                                ],
                                              )),
                                        ];
                                      }),
                                ),
                                Container(
                                  // color: kred,
                                  height: 140,
                                  width: double.infinity,
                                  child: Center(
                                    child: SizedBox(
                                        height: 130,
                                        width: 130,
                                        child: Image(
                                          image: NetworkImage(snapshot.data!.docs[index]['image1']),
                                        )),
                                  ),
                                ),
                                Expanded(
                                    child: Column(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 7.0),
                                          child: Text(
                                            snapshot.data!.docs[index]['productName'],
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: kblack,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 15),
                                          ),
                                        )),
                                    SizedBox(
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 7.0),
                                          child: Shimmer.fromColors(
                                            baseColor: const Color.fromARGB(255, 64, 0, 255)
                                                .withOpacity(.9),
                                            highlightColor: Colors.deepOrange,
                                            child: Text(
                                              '${snapshot.data!.docs[index]['offerPercentage']}% off',
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  // decorationThickness: 1.8,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Container(
                                            // color: kred,
                                            width: MediaQuery.of(context).size.width * 0.23,
                                            height: 20,
                                            child: Text(
                                              '₹ ${snapshot.data!.docs[index]['realPrice']}.00',
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 61, 59, 59),
                                                  overflow: TextOverflow.ellipsis,
                                                  decoration: TextDecoration.lineThrough,
                                                  decorationColor: Colors.red,
                                                  decorationThickness: 1.8,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          // SizedBox(
                                          //   width: 8,
                                          // ),
                                          Shimmer.fromColors(
                                            baseColor:
                                                Color.fromARGB(255, 5, 153, 32).withOpacity(.9),
                                            highlightColor: Color.fromARGB(255, 0, 255, 8),
                                            child: Container(
                                              // color: Colors.green,
                                              width: MediaQuery.of(context).size.width * 0.21,
                                              child: Text(
                                                '₹ ${snapshot.data!.docs[index]['offerPrice']}.00',
                                                style: TextStyle(
                                                    overflow: TextOverflow.ellipsis,
                                                    color: Colors.green,
                                                    // decorationThickness: 1.8,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                          Spacer(
                                            flex: 15,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: Colors.transparent),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LoadingAnimationWidget.waveDots(
                              color: Colors.white,
                              size: 45,
                            ),
                          ],
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}

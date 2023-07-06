import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

import 'package:sole_sphere_admin/presentation/add_brands_screens/add_brands_screen.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

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
          title: Text(
            'ALL BRANDS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => AddBrandsScreen(),
                ));
              },
              child: Icon(
                Icons.add,
                size: 28,
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('solesphere')
                .doc('admin')
                .collection('brands')
                .snapshots(),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 250,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10), color: kwhite),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.width * 0.13,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 160,
                                    child: Image(
                                        image: NetworkImage(snapshot.data!.docs[index]['image']))),
                                SizedBox(
                                  height: size.width * 0.05,
                                ),
                                Text(
                                  snapshot.data!.docs[index]['brandName'],
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                                ),
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
            }));
  }
}

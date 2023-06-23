import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

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
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 280,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: kwhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.35),
                      width: double.infinity,
                      height: 50,
                      // color: Colors.red,
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
                        },
                      ),
                    ),
                    Image.asset(
                      'assets/images/bagrem.png',
                    ),
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 5),
                      child: Text(
                        'Nike Air Max',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          Text(
                            '₹ 3258',
                            style: TextStyle(
                                color: Color.fromARGB(255, 129, 127, 127),
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.red,
                                decorationThickness: 1.6,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Spacer(flex: 1),
                          Text(
                            '₹ 3258',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.green),
                          ),
                          Spacer(flex: 5),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: Text(
                        'Only 1 left',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

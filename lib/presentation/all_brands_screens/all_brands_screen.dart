import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/infrastructure/add_brand_functions/add_brand_function.dart';
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
        body: (brandList.isNotEmpty)
            ? GridView.builder(
                itemCount: brandList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kwhite),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.width * 0.13,
                          ),
                          SizedBox(
                            height: 100,
                            width: 160,
                            child: Image(
                                image: FileImage(
                                    File(brandList[index].brandImage))),
                          ),
                          SizedBox(
                            height: size.width * 0.05,
                          ),
                          Text(
                            brandList[index].brandName,
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                'ADD NEW BRAND',
                style: TextStyle(color: kwhite),
              )));
  }
}

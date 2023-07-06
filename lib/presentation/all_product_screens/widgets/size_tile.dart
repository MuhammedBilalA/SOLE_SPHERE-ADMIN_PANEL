import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/product_details_size.dart';

import 'package:sole_sphere_admin/core/colors/colors.dart';

class SizeTile extends StatelessWidget {
  SizeTile({super.key, required this.index, required this.size, required this.availableQuandity});

  final int index;
  String size;
  List<dynamic> availableQuandity;

  @override
  Widget build(BuildContext context) {
    SizeController controller = Provider.of<SizeController>(context);
    return Center(
      child: InkWell(
        onTap: () {
          log(availableQuandity[index]);
          controller.indexchange(index, availableQuandity);
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (index == controller.index) ? kwhite : const Color.fromARGB(255, 36, 35, 35),
          ),
          child: Center(
            child: Text(
              size,
              style: TextStyle(
                  color: (index == controller.index) ? kblack : kwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

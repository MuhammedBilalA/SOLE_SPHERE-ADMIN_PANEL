
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sole_sphere_admin/application/add_product/add_size_notifier.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class SizeCountWidget extends StatelessWidget {
  const SizeCountWidget({super.key, required this.size, required this.issize});
  final bool issize;
  final int size;
  @override
  Widget build(BuildContext context) {
    AddSizeNotifier value = Provider.of<AddSizeNotifier>(context);
    return Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(color: kred, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              value.decrement(isSize: issize);
            },
            child: Icon(
              Icons.remove_circle_outline,
              size: 25,
              color: kwhite,
            ),
          ),
          Text(
            '$size',
            style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: () {
              value.increment(isSize: issize);
            },
            child: Icon(
              Icons.add_circle_outline_sharp,
              size: 25,
              color: kwhite,
            ),
          )
        ],
      ),
    );
  }
}

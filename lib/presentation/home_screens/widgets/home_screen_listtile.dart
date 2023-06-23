import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class HomeScreenListTile extends StatelessWidget {
  HomeScreenListTile({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: kwhite, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          '$title',
          style: TextStyle(
              color: kwhite, fontWeight: FontWeight.w300, fontSize: 22),
        ),
      ),
    );
  }
}

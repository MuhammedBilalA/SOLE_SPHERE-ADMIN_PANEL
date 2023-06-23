import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/add_brands_screens/add_brands_screen.dart';
import 'package:sole_sphere_admin/presentation/add_product_screen/add_product_screen.dart';
import 'package:sole_sphere_admin/presentation/all_brands_screens/all_brands_screen.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/all_orders.screen.dart';

import 'package:sole_sphere_admin/presentation/all_product_screens/all_product_screen.dart';
import 'package:sole_sphere_admin/presentation/home_screens/widgets/home_screen_listtile.dart';
import 'package:sole_sphere_admin/presentation/user_details_screen/all_users_sceen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kblack,
        appBar: AppBar(
          // elevation: 2,
          centerTitle: true,
          title: Text(
            'ADMIN PANEL',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllProductScreen()));
                  },
                  child: HomeScreenListTile(title: 'ALL PRODUCT')),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllBrandsScreen()));
                  },
                  child: HomeScreenListTile(title: 'ALL BRANDS')),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddProductScreen()));
                  },
                  child: HomeScreenListTile(title: 'ADD PRODUCT')),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllOrdersScreens()));
                  },
                  child: HomeScreenListTile(title: 'ALL ORDERS')),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllUsersScreen()));
                  },
                  child: HomeScreenListTile(title: 'User Details')),
            ],
          ),
        ));
  }
}

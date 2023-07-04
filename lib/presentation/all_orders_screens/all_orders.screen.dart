import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/order_details.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/order_details_tile.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/track_order.dart';
import 'package:sole_sphere_admin/widgets/question_popup.dart';
import 'package:sole_sphere_admin/widgets/snackbar.dart';

class AllOrdersScreens extends StatelessWidget {
  const AllOrdersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kblack,
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 15, 15, 15),
          centerTitle: true,
          title: const Text(
            'ORDER SCREEN',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: kblack,
              labelColor: kblack,
              tabs: [
                Tab(
                  child: Text(
                    'Active',
                    style: TextStyle(color: kwhite),
                  ),
                ),
                Tab(
                  child: Text(
                    'Completed',
                    style: TextStyle(color: kwhite),
                  ),
                ),
                Tab(
                  child: Text(
                    'Cancel Request',
                    style: TextStyle(color: kwhite),
                  ),
                ),
                Tab(
                  child: Text(
                    'Canceled Orders',
                    style: TextStyle(
                      color: kwhite,
                    ),
                  ),
                ),
              ]),

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: kwhite,
              )),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrderDetails(),
                      ));
                    },
                    child: OrderDetailsTile(
                      track: true,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return OrderDetailsTile(
                    track: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return OrderDetailsTile(
                    track: true,
                    color: Colors.red,
                    trialing: 'Cancel',
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return OrderDetailsTile(
                    track: false,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3),
          ),
        ]),
      ),
    );
  }
}

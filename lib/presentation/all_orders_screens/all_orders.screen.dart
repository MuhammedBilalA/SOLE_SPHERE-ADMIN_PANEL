import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/order_details.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/track_order.dart';

class AllOrdersScreens extends StatelessWidget {
  const AllOrdersScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
              ]),

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
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
                        builder: (context) => OrderDetails(),
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
        ]),
      ),
    );
  }
}

class OrderDetailsTile extends StatelessWidget {
  OrderDetailsTile({super.key, required this.track});
  bool track;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: kwhite),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kwhite),
              child: Image.asset(
                'assets/images/bagrem.png',
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Text(
                  'NIKE',
                  style: TextStyle(
                      color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 200,
                  // color: Colors.red,
                  child: Text(
                    'Order Id : 150860646464',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
                Text(
                  'Quandity : 1',
                  style: TextStyle(
                      color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '₹ 3258',
                  style: TextStyle(
                      color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox()
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TrackOrder(),
                ));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  'TRACK',
                  style: TextStyle(
                      color: (track == true) ? kwhite : kblack,
                      fontWeight: FontWeight.w900,
                      fontSize: 15),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

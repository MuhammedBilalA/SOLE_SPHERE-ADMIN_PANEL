import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/all_orders.screen.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/order_details_tile.dart';

class TrackOrder extends StatelessWidget {
  TrackOrder({Key? key}) : super(key: key);

  List<TextDto> orderList = [
    TextDto("Your order has been placed", ""),
    TextDto("Seller processed your order", ""),
    TextDto("Your item has been picked up by courier partner.", ""),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", ""),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto(
      "Your order is out for delivery",
      "",
    ),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        title: const Text(
          'Track Your Order',
          style: TextStyle(fontSize: 25, color: kwhite, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kblack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: kwhite,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          OrderDetailsTile(track: false),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OrderTracker(
              headingTitleStyle: const TextStyle(color: kwhite),
              headingDateTextStyle: const TextStyle(color: kwhite),
              subDateTextStyle: const TextStyle(color: kwhite),
              status: statusList[0],
              subTitleTextStyle: const TextStyle(color: kwhite),
              activeColor: Colors.green,
              inActiveColor: kwhite,
              orderTitleAndDateList: orderList,
              shippedTitleAndDateList: shippedList,
              outOfDeliveryTitleAndDateList: outOfDeliveryList,
              deliveredTitleAndDateList: deliveredList,
            ),
          ),
        ],
      ),
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     FloatingActionButton(
      //         backgroundColor: kwhite,
      //         onPressed: () {},
      //         child: const Text(
      //           'Delay',
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      //         )),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //         backgroundColor: kwhite, onPressed: () {}, child: const Icon(Icons.add)),
      //   ],
      // ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 120,
        // color: kred,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: kwhite, width: 1.5),
              ),
              child: Center(
                child: Text(
                  'Delay',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: kwhite, width: 1.5),
              ),
              child: Center(
                child: Text(
                  'Next Step',
                  style: TextStyle(color: kwhite, fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<Status> statusList = [Status.order, Status.shipped, Status.outOfDelivery, Status.delivered];

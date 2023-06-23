import 'package:flutter/material.dart';
import 'package:order_tracker/order_tracker.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/all_orders.screen.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  State<TrackOrder> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TrackOrder> {
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
          style: TextStyle(
              fontSize: 25, color: kwhite, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kblack,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kwhite,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          OrderDetailsTile(track: false),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: OrderTracker(
              headingTitleStyle: TextStyle(color: kwhite),
              headingDateTextStyle: TextStyle(color: kwhite),
              subDateTextStyle: TextStyle(color: kwhite),
              status: Status.delivered,
              subTitleTextStyle: TextStyle(color: kwhite),
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: kwhite,
          onPressed: () {},
          child: const Icon(Icons.add)),
    );
  }
}

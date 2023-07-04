import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ORDER DETAILS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: kwhite,
            width: double.infinity,
            height: 300,
            child: Image.asset('assets/images/bagrem.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Id  :  12378942656',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Name  :  AIR JORDHAN',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Real Price  :  ₹ 3,999',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Offer Price  :  ₹ 2,999',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OfferPercentage  :  40%',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Amount Payable  :  ₹ 2,999',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Quandity  :  1',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Selected Size  :  8',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'E-mail  :  bilalmuhammed402@gmail.com',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Shipping Address :',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'brototype koxhi maradu ernakulam ,688005',
                  style: TextStyle(color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

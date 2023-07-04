
import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/all_orders_screens/widgets/track_order.dart';
import 'package:sole_sphere_admin/widgets/question_popup.dart';
import 'package:sole_sphere_admin/widgets/snackbar.dart';

class OrderDetailsTile extends StatelessWidget {
 const OrderDetailsTile({super.key, required this.track, this.trialing = 'TRACK', this.color = kwhite});
 final  bool track;
 final  String trialing;
 final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            border: Border.all(color: kwhite), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 115,
              width: 115,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kwhite),
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
                  style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox(
                  width: 200,
                  // color: Colors.red,
                  child: Text(
                    'Order Id : 150860646464',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                Text(
                  'Quandity : 1',
                  style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  '₹ 3258',
                  style: TextStyle(color: kwhite, fontWeight: FontWeight.bold, fontSize: 17),
                ),
                SizedBox()
              ],
            ),
            InkWell(
              onTap: () {
                if (trialing == 'TRACK') {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrackOrder(),
                  ));
                } else {
                  questionPopUp(
                      function: () {
                        snackbarFailed(text: 'Canceled this order', context: context);
                        Navigator.pop(context);
                      },
                      context: context,
                      title: 'Are you sure you want to Cancel this order',
                      yes: 'Yes',
                      no: 'No');
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Text(
                  trialing,
                  style: TextStyle(
                      color: (track == true) ? color : kblack,
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

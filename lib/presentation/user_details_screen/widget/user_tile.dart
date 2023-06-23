
import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: kwhite)),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          const CircleAvatar(
              backgroundColor: kwhite,
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/DAY07895-011.jpg',
              )),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: double.infinity,
            // color: Colors.red,
            width: MediaQuery.of(context).size.width * 0.64,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  'MUHAMMED BILAL A',
                  style: TextStyle(
                      color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '8606708772',
                  style: TextStyle(
                      color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'bilalmuhammed402@gmail.com',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kwhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MUHAMMED BILAL A',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            color: kwhite,
            width: double.infinity,
            height: 300,
            child: Center(
              child: SizedBox(
                // color: Colors.red,
                height: 280,
                width: 350,
                child: Image.asset(
                  'assets/images/DAY07895-011.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Name : MUHAMMED BILAL A',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Phone : 8606708772',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'E-mail : bilalmuhammed402@gmail.com',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Purchaced Count : 10',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Cancelled Count : 5',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Address : brototype koxhi maradu ernakulam ,688005',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 194, 0, 0))),
                        onPressed: () {},
                        icon: Icon(Icons.block),
                        label: Text('Bloc User')),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

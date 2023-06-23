import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key, required this.isActive});
  bool isActive;

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
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Name : MUHAMMED BILAL A',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Phone : 8606708772',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'E-mail : bilalmuhammed402@gmail.com',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Purchaced Count : 10',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Cancelled Count : 5',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Address : brototype koxhi maradu ernakulam ,688005',
                  style: TextStyle(
                      color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (isActive)
                        ? ElevatedButton.icon(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 194, 0, 0))),
                            onPressed: () {},
                            icon: const Icon(Icons.block),
                            label: const Text('Bloc User'))
                        : ElevatedButton.icon(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 0, 194, 3))),
                            onPressed: () {},
                            icon: const Icon(Icons.verified_user_outlined),
                            label: const Text('Active User')),
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

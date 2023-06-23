import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/user_details_screen/widget/user_details.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kwhite,
            )),
        // elevation: 2,
        centerTitle: true,
        title: const Text(
          'USER DETAILS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserDetails(),
                  ));
                },
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: kwhite)),
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const CircleAvatar(
                          // child: Container(
                          //   height: 150,
                          //   width: 150,
                          //   decoration: BoxDecoration(
                          //       color: Colors.red,
                          //       borderRadius: BorderRadius.circular(50)),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(50),
                          //     child: Image.asset(
                          //       'assets/images/DAY07895-011.jpg',
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          backgroundColor: kwhite,
                          radius: 55,
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
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '8606708772',
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'bilalmuhdsdfsfammed402@gmail.com',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Product purchaced : 5',
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: 10),
    );
  }
}

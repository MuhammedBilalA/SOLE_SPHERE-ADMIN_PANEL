import 'package:flutter/material.dart';
import 'package:sole_sphere_admin/core/colors/colors.dart';
import 'package:sole_sphere_admin/presentation/user_details_screen/widget/user_details.dart';
import 'package:sole_sphere_admin/presentation/user_details_screen/widget/user_tile.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            bottom: const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: kblack,
                labelColor: kblack,
                tabs: [
                  Tab(
                    child: Text(
                      'Active User',
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Blocked User',
                      style: TextStyle(color: kwhite),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetails(isActive: true),
                        ));
                      },
                      child: UserTile(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 10),
            ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDetails(isActive: false,),
                        ));
                      },
                      child: UserTile(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: 3),
          ])),
    );
  }
}

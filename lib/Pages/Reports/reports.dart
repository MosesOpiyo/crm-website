import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  static const String route = '/DashBoard/Reports';
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            width: size.width * .8,
            child: Column(
              children: [
                AppBar(
                  automaticallyImplyLeading: false,
                  title: const Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Reports",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_2_outlined,
                            color: Colors.white,
                          ),
                          FutureBuilder(
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data!.username,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              } else {
                                return const Text('');
                              }
                            },
                            future: Userservice().getProfile(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                    width: size.width,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

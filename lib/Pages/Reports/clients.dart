import 'package:crm/Pages/Reports/products.dart';
import 'package:crm/Pages/Reports/suppliers.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  static const String route = '/DashBoard/Reports/Clients';
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
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
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          "Reports Panel",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      const Spacer(),
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
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Column(
                              children: [
                                Text("Sold Stocks Value",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Ksh 100,000",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            )),
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Column(
                              children: [
                                Text("Sold Units",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("100 Units",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            )),
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Column(
                              children: [
                                Text("Pending Units",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("20 Units",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            )),
                        const Spacer(),
                        Container(
                            alignment: Alignment.center,
                            width: 250,
                            height: 75,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Column(
                              children: [
                                Text("Sales",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                Text("Ksh 100,000",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            )),
                        const Spacer(),
                      ],
                    )),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Suppliers.route);
                          },
                          child: const Text("Suppliers",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Clients",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Products.route);
                          },
                          child: const Text("Products",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          "Clients",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

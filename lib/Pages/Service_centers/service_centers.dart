import 'package:crm/Pages/Service_centers/single_service_center.dart';
import 'package:crm/Service/Service_Centers/service_sevice.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class ServiceCenters extends StatelessWidget {
  static const String route = '/DashBoard/ServiceCenters';
  const ServiceCenters({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: ServiceCentersBody(),
          )
        ],
      ),
    );
  }
}

class ServiceCentersBody extends StatefulWidget {
  const ServiceCentersBody({super.key});

  @override
  State<ServiceCentersBody> createState() => _ServiceCentersBodyState();
}

class _ServiceCentersBodyState extends State<ServiceCentersBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String center = '';
  TextEditingController centerController = TextEditingController();

  newCenter() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("New Service Center"),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(
                builder: (context, setState) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return SizedBox(
                      height: height - 400,
                      width: width - 950,
                      child: Column(children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 2, bottom: 5),
                                  width: 330,
                                  alignment: Alignment.centerLeft,
                                  child: const Row(
                                    children: [
                                      Text(
                                        "Service Center Name",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "*",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 330,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        labelText: 'Service Center Name'),
                                    keyboardType: TextInputType.text,
                                    controller: centerController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Row(children: [
                          const Spacer(),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.blue)))),
                              onPressed: () {
                                center = centerController.text;
                                Serviceservice().newCenter(center);
                                Navigator.of(ctx).pop();
                                Navigator.pushNamed(
                                    context, ServiceCenters.route);
                              },
                              child: const Text("Add",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ))),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.blue)))),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text("Cancel",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400,
                                  )))
                        ])
                      ]));
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * .8,
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              title: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Service Center Panel",
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
            const SizedBox(
              height: 20,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(5),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                          color: Colors.blue)))),
                          onPressed: () {
                            newCenter();
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text("Add Service Center",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ],
                          )),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 330,
                      height: 45,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Search'),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                width: size.width,
                child: FutureBuilder(
                    future: Serviceservice().getServiceCenters(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            DataTable(
                                showCheckboxColumn: false,
                                columns: const [
                                  DataColumn(
                                      label: Text("Service Center Name",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("No. of Devices",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                ],
                                rows: List.generate(snapshot.data!.length,
                                    (index) {
                                  var data = snapshot.data![index];
                                  return DataRow(
                                      onSelectChanged: (value) {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: SingleService(
                                                    id: data.id)));
                                      },
                                      cells: [
                                        DataCell(
                                          Text(data.serviceCenterName),
                                        ),
                                        DataCell(
                                          Text(data.devices.length.toString()),
                                        ),
                                      ]);
                                }).toList()),
                          ],
                        );
                      } else {
                        return Text("${snapshot.error}");
                      }
                    }))
          ],
        ));
  }
}

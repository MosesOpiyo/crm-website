// ignore_for_file: file_names

import 'package:crm/Pages/Sales/single_sale.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crm/Service/Sales/sales_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  static const String route = '/DashBoard/Sales';

  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: SalesBody(),
          )
        ],
      ),
    );
  }
}

class SalesBody extends StatefulWidget {
  const SalesBody({super.key});

  @override
  State<SalesBody> createState() => _SalesBodyState();
}

class _SalesBodyState extends State<SalesBody> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'At The Shop';
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
                  "Sales Panel",
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
              child: AppBar(
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.blue)))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                        title: const Text("New Sale"),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        content: Builder(
                                          builder: (context) {
                                            var height = MediaQuery.of(context)
                                                .size
                                                .height;
                                            var width = MediaQuery.of(context)
                                                .size
                                                .width;

                                            return SizedBox(
                                              height: height - 200,
                                              width: width - 600,
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Product",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Product'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Supplier",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Product'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "IMEI",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'IMEI'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Delivered By",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Delivered By'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Client Name",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Client Name'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Status",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            width: 330,
                                                            height: 55,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              // Step 3.

                                                              value:
                                                                  dropdownValue,
                                                              // Step 4.
                                                              items: <String>[
                                                                'At The Shop',
                                                                'Invoiced',
                                                                'Sold',
                                                                'Returned'
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              // Step 5.
                                                              onChanged: (String?
                                                                  newValue) {
                                                                setState(() {
                                                                  dropdownValue =
                                                                      newValue!;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Cash",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Cash'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Mpesa",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Mpesa'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            width: 330,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Invoiced Amount",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "*",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 330,
                                                            child:
                                                                TextFormField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  labelText:
                                                                      'Invoiced Amount'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .text,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                    ],
                                                  ),
                                                  Row(children: [
                                                    const Spacer(),
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .blue),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    side: const BorderSide(
                                                                        color: Colors
                                                                            .blue)))),
                                                        onPressed: () {},
                                                        child: const Text("Add",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 10)),
                                                    ElevatedButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty.all<Color>(
                                                                    Colors
                                                                        .white),
                                                            shape: MaterialStateProperty.all<
                                                                    RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    side: const BorderSide(
                                                                        color: Colors
                                                                            .blue)))),
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: const Text("Cancel",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            )))
                                                  ])
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ));
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                Text("Add Sale",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                actions: [
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
            Container(
                margin: const EdgeInsets.all(10),
                width: size.width,
                child: FutureBuilder(
                    future: Salesservice().getSales(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            DataTable(
                                columns: const [
                                  DataColumn(
                                      label: Text("Product",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Supplier",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("IMEI",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Courier",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Client",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Status",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Cash",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Mpesa",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Invoiced",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          )))
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
                                                child: SingleSale(
                                                    saleId: data.id)));
                                      },
                                      cells: [
                                        DataCell(
                                          Text(data.product),
                                        ),
                                        DataCell(
                                          Text(data.supplier),
                                        ),
                                        DataCell(
                                          Text(data.imei.toString()),
                                        ),
                                        DataCell(
                                          Text(data.deliveredBy),
                                        ),
                                        DataCell(
                                          Text(data.clientName),
                                        ),
                                        DataCell(
                                          Text(data.status),
                                        ),
                                        DataCell(
                                          Text(data.cash.toString()),
                                        ),
                                        DataCell(
                                          Text(data.mpesa.toString()),
                                        ),
                                        DataCell(
                                          Text(data.invoicedAmount.toString()),
                                        ),
                                      ]);
                                }).toList()),
                          ],
                        );
                      } else {
                        return const Text("No data");
                      }
                    }))
          ],
        ));
  }
}

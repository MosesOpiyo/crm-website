import 'package:crm/Service/Sales/sales_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class SingleSale extends StatelessWidget {
  static const String route = '/DashBoard/Single_Sales';
  final int saleId;
  const SingleSale({required this.saleId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: SingleSaleBody(
              id: saleId,
            ),
          ),
        ],
      ),
    );
  }
}

class SingleSaleBody extends StatefulWidget {
  final int id;
  const SingleSaleBody({super.key, required this.id});

  @override
  State<SingleSaleBody> createState() => _SingleSaleBodyState();
}

class _SingleSaleBodyState extends State<SingleSaleBody> {
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
                padding: EdgeInsets.zero,
                child: Text(
                  "Single Sale",
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder(
                        future: Salesservice().getSingleSale(widget.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Text("${snapshot.data!.product} Sale",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ],
                                ));
                          } else {
                            return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 15),
                                child: const Column(
                                  children: [
                                    Text("Device Sale",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  ],
                                ));
                          }
                        }),
                    const Spacer(),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 5, top: 10),
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
                                  Icons.edit_outlined,
                                  color: Colors.white,
                                ),
                                Text("Edit Sale",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ))
                              ],
                            )),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 15)),
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
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.document_scanner,
                                  color: Colors.white,
                                ),
                                Text("Print Sale",
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
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 5),
              margin: const EdgeInsets.only(left: 15),
              child: const Text("Sales Properties",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            FutureBuilder(
                future: Salesservice().getSingleSale(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Product",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Supplier",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("IMEI",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Picked at shop",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Courier",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Client Name",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text(
                                                "Client Phone Number",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Client Email",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Client Location",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Client Pin",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(snapshot.data!.product,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(snapshot.data!.supplier,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.imei.toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.pickedAtShop
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.deliveredBy,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.clientName,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.clientPhoneNumber
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.clientEmail,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.clientLocation,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.clientPin,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Sold by",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Status",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Warranty status",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Cash",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Mpesa",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Invoiced Amount",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Expense Name",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: const Text("Expense Amount",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 25),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(snapshot.data!.soldBy,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(snapshot.data!.status,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.warrantyStatus,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.cash.toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.mpesa.toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.invoicedAmount
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.expenseName,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.expenseAmount
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text("No Data Found");
                  }
                })
          ],
        ));
  }
}

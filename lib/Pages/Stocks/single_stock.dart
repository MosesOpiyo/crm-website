import 'package:crm/Service/Stock/stock_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class SingleStock extends StatelessWidget {
  final int id;
  const SingleStock({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: SingleStockBody(
              id: id,
            ),
          )
        ],
      ),
    );
  }
}

class SingleStockBody extends StatefulWidget {
  final int id;
  const SingleStockBody({required this.id, super.key});

  @override
  State<SingleStockBody> createState() => _SingleStockBodyState();
}

class _SingleStockBodyState extends State<SingleStockBody> {
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
                padding: EdgeInsets.zero,
                child: Text(
                  "Single Stock",
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
                        future: Stockservice().getSingleStock(widget.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Text(snapshot.data!.product,
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
                future: Stockservice().getSingleStock(widget.id),
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
                                            child: const Text("Checked In By",
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
                                            child: const Text("Warranty Status",
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
                                            child: const Text("Amount",
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
                                                snapshot
                                                    .data!.checkedInPersonName
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
                                                snapshot.data!.warrantyDuration,
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
                                                snapshot.data!.amount
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

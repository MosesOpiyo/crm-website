// ignore_for_file: unrelated_type_equality_checks

import 'package:crm/Pages/Stocks/single_stock.dart';
import 'package:crm/Service/Stock/stock_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stocks extends StatelessWidget {
  static const String route = '/DashBoard/Stocks';
  const Stocks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: StocksBody(),
          )
        ],
      ),
    );
  }
}

class StocksBody extends StatefulWidget {
  const StocksBody({super.key});

  @override
  State<StocksBody> createState() => _StocksBodyState();
}

class _StocksBodyState extends State<StocksBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  String product = '';
  String supplier = '';
  String imei = '';
  String checkedInPersonName = '';
  String warrantyDuration = '';
  String amount = '';
  TextEditingController productController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController imeiController = TextEditingController();
  TextEditingController checkedInPersonNameController = TextEditingController();
  TextEditingController warrantyDurationController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
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
                      "Stocks Panel",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
              width: size.width,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: SizedBox(
                      height: 40,
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
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: const Text("New Stock"),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0))),
                                      content: Builder(
                                        builder: (context) {
                                          var height = MediaQuery.of(context)
                                              .size
                                              .height;
                                          var width =
                                              MediaQuery.of(context).size.width;

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
                                                          child: TextFormField(
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
                                                            controller:
                                                                productController,
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
                                                          child: TextFormField(
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
                                                            controller:
                                                                supplierController,
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
                                                          child: TextFormField(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                labelText:
                                                                    'IMEI'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                imeiController,
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
                                                                "Checked In By",
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
                                                          child: TextFormField(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                labelText:
                                                                    'Checked In By'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                checkedInPersonNameController,
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
                                                                "Warranty Duration",
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
                                                          child: TextFormField(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                labelText:
                                                                    'Warranty Duration'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                warrantyDurationController,
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
                                                                "Amount",
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
                                                          child: TextFormField(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0)),
                                                                labelText:
                                                                    'Amount'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                amountController,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10)),
                                                Row(children: [
                                                  const Spacer(),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty.all<
                                                                      Color>(
                                                                  Colors.blue),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  side: const BorderSide(
                                                                      color: Colors.blue)))),
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                        product =
                                                            productController
                                                                .text;
                                                        supplier =
                                                            supplierController
                                                                .text;
                                                        imei =
                                                            imeiController.text;

                                                        checkedInPersonName =
                                                            checkedInPersonNameController
                                                                .text;
                                                        warrantyDuration =
                                                            warrantyDurationController
                                                                .text;
                                                        amount =
                                                            amountController
                                                                .text;

                                                        Stockservice().postStock(
                                                            product,
                                                            supplier,
                                                            imei,
                                                            checkedInPersonName,
                                                            warrantyDuration,
                                                            amount);
                                                      },
                                                      child: const Text("Add",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ))),
                                                  const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10)),
                                                  ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty.all<
                                                                      Color>(
                                                                  Colors.white),
                                                          shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          10),
                                                                  side: const BorderSide(
                                                                      color: Colors.blue)))),
                                                      onPressed: () {
                                                        Navigator.of(ctx).pop();
                                                      },
                                                      child: const Text("Cancel",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                    ),
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
            Container(
                margin: const EdgeInsets.all(10),
                width: size.width,
                child: FutureBuilder(
                    future: Stockservice().getStocks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            DataTable(
                                showCheckboxColumn: false,
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
                                      label: Text("Checked In By",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Warranty Duration",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Amount",
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
                                                child:
                                                    SingleStock(id: data.id)));
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
                                          Text(data.checkedInPersonName),
                                        ),
                                        DataCell(
                                          Text(data.warrantyDuration),
                                        ),
                                        DataCell(
                                          Text(data.amount.toString()),
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

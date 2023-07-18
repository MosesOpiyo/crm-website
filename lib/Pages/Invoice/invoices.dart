import 'package:crm/Pages/Invoice/single_invoice.dart';
import 'package:crm/Service/Invoice/invoice_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Invoices extends StatelessWidget {
  static const String route = '/DashBoard/Invoices';
  const Invoices({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: InvoicesBody(),
          )
        ],
      ),
    );
  }
}

class InvoicesBody extends StatefulWidget {
  const InvoicesBody({super.key});

  @override
  State<InvoicesBody> createState() => _InvoicesBodyState();
}

class _InvoicesBodyState extends State<InvoicesBody> {
  String supplierName = '';
  int amount = 0;
  int poNumber = 0;
  String dueDate = '';
  int balance = 0;
  String paidMoneyFrom = '';
  String paymentMethod = '';
  int chequeNoOrRef = 0;
  String invoiceDate = '';
  int invoiceNumber = 0;
  int amountPaid = 0;

  TextEditingController supplierController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController poNumberController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController paidMoneyFromController = TextEditingController();
  TextEditingController paymentMethodController = TextEditingController();
  TextEditingController chequeOrReferenceController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController paidAmountController = TextEditingController();

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
                      "Invoices Panel",
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
                                      title: const Text("New Invoice"),
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
                                                                    'Supplier'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                supplierController,
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
                                                                    .text,
                                                            controller:
                                                                amountController,
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
                                                                "P.O Number",
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
                                                                    'P.O Number'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                poNumberController,
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
                                                                "Due Date",
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
                                                                    'Due Date'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                dueDateController,
                                                            onTap: () async {
                                                              DateTime? pickedDate = await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1950),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100));

                                                              if (pickedDate !=
                                                                  null) {
                                                                String
                                                                    formattedDate =
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            pickedDate);
                                                                setState(() {
                                                                  dueDateController
                                                                          .text =
                                                                      formattedDate;
                                                                });
                                                              } else {}
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
                                                                "Balance",
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
                                                                    'Balance'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                balanceController,
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
                                                                "Paid Money From",
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
                                                                      'Paid Money From'),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              controller:
                                                                  paidMoneyFromController,
                                                              onTap: () async {
                                                                DateTime? pickedDate = await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime(
                                                                            1950),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100));

                                                                if (pickedDate !=
                                                                    null) {
                                                                  String
                                                                      formattedDate =
                                                                      DateFormat(
                                                                              'yyyy-MM-dd')
                                                                          .format(
                                                                              pickedDate);
                                                                  setState(() {
                                                                    paidMoneyFromController
                                                                            .text =
                                                                        formattedDate;
                                                                  });
                                                                } else {}
                                                              }),
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
                                                                "Payment Method",
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
                                                                    'Payment Method'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                paymentMethodController,
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
                                                                "Cheque or Reference",
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
                                                                    'Cheque or Reference'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                chequeOrReferenceController,
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
                                                                "Invoice Date",
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
                                                                    'Invoice Date'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                invoiceDateController,
                                                            onTap: () async {
                                                              DateTime? pickedDate = await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1950),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100));

                                                              if (pickedDate !=
                                                                  null) {
                                                                String
                                                                    formattedDate =
                                                                    DateFormat(
                                                                            'yyyy-MM-dd')
                                                                        .format(
                                                                            pickedDate);
                                                                setState(() {
                                                                  invoiceDateController
                                                                          .text =
                                                                      formattedDate;
                                                                });
                                                              } else {}
                                                            },
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
                                                                "Invoice Number",
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
                                                                    'Invoice Number'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            controller:
                                                                invoiceNumberController,
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
                                                                "Amount Paid",
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
                                                                    'Amount Paid'),
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                paidAmountController,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
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
                                                        supplierName =
                                                            supplierController
                                                                .text;
                                                        amount = int.parse(
                                                            amountController
                                                                .text);
                                                        poNumber = int.parse(
                                                            poNumberController
                                                                .text);
                                                        dueDate =
                                                            dueDateController
                                                                .text;
                                                        balance = int.parse(
                                                            balanceController
                                                                .text);
                                                        paidMoneyFrom =
                                                            paidMoneyFromController
                                                                .text;
                                                        paymentMethod =
                                                            paymentMethodController
                                                                .text;
                                                        chequeNoOrRef = int.parse(
                                                            chequeOrReferenceController
                                                                .text);
                                                        invoiceDate =
                                                            invoiceDateController
                                                                .text;
                                                        invoiceNumber = int.parse(
                                                            invoiceNumberController
                                                                .text);
                                                        amountPaid = int.parse(
                                                            amountController
                                                                .text);
                                                        InvoiceService()
                                                            .postInvoice(
                                                                supplierName,
                                                                amount,
                                                                poNumber,
                                                                dueDate,
                                                                balance,
                                                                paidMoneyFrom,
                                                                paymentMethod,
                                                                chequeNoOrRef,
                                                                invoiceDate,
                                                                invoiceNumber,
                                                                amountPaid)
                                                            .then((value) {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        });
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
                              Text("Add Invoice",
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
                    future: InvoiceService().getInvoices(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          shrinkWrap: true,
                          children: [
                            DataTable(
                                showCheckboxColumn: false,
                                columns: const [
                                  DataColumn(
                                      label: Text("Docx No.",
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
                                      label: Text("P.O Number",
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
                                  DataColumn(
                                      label: Text("Due Date",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Balance",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ))),
                                  DataColumn(
                                      label: Text("Number Of Devices",
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
                                                child: SingleInvoice(
                                                    id: data.id)));
                                      },
                                      cells: [
                                        DataCell(
                                          Text(data.documentNumber.toString()),
                                        ),
                                        DataCell(
                                          Text(data.supplierName),
                                        ),
                                        DataCell(
                                          Text(data.poNumber.toString()),
                                        ),
                                        DataCell(
                                          Text(data.amount.toString()),
                                        ),
                                        DataCell(
                                          Text(data.dueDate),
                                        ),
                                        DataCell(
                                          Text(data.balance.toString()),
                                        ),
                                        DataCell(
                                          Text(data.items.length.toString()),
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

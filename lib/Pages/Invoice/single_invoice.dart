import 'package:crm/Service/Invoice/invoice_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';

class SingleInvoice extends StatelessWidget {
  static const String route = '/DashBoard/SingleInvoice';
  final int id;
  const SingleInvoice({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SizedBox(
            child: SideNav(),
          ),
          SizedBox(
            child: SingleInvoiceBody(
              id: id,
            ),
          )
        ],
      ),
    );
  }
}

class SingleInvoiceBody extends StatefulWidget {
  final int id;
  const SingleInvoiceBody({super.key, required this.id});

  @override
  State<SingleInvoiceBody> createState() => _SingleInvoiceBodyState();
}

class _SingleInvoiceBodyState extends State<SingleInvoiceBody> {
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
                  "Single Invoice",
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
                        future: InvoiceService().getSingleInvoice(widget.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Text(
                                        "${snapshot.data!.documentNumber} Invoice",
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
                                    Text("No Invoice Found",
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
                      FutureBuilder(
                          future: InvoiceService().getSingleInvoice(widget.id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 40,
                                child: ElevatedButton(
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
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        ),
                                        Text("Edit Invoice",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    )),
                              );
                            } else {
                              return SizedBox(
                                height: 40,
                                child: ElevatedButton(
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
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.edit_outlined,
                                          color: Colors.white,
                                        ),
                                        Text("Edit Invoice",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ))
                                      ],
                                    )),
                              );
                            }
                          }),
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
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                                Text("View Invoice PDF",
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
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.red)))),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.white,
                                ),
                                Text("Delete Invoice",
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
                future: InvoiceService().getSingleInvoice(widget.id),
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
                                            child: const Text("Document Number",
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
                                            child: const Text("Amount",
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
                                                "Number Of Devices",
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
                                            child: const Text("P.O Number",
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
                                            child: const Text("Due Date",
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
                                            child: const Text("Balance",
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
                                            child: const Text("Payment Date",
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
                                            child: const Text("Paid From",
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
                                            child: const Text("Payment Method",
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
                                            child: Text(
                                                snapshot.data!.documentNumber,
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
                                                snapshot.data!.supplierName,
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
                                          Container(
                                            width: 200,
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.zero,
                                            height: 30,
                                            child: Text(
                                                snapshot.data!.numberOfDevices
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
                                                snapshot.data!.poNumber
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
                                            child: Text(snapshot.data!.dueDate,
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
                                                snapshot.data!.balance
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
                                                snapshot.data!.paymentDate,
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
                                                snapshot.data!.payThisMoneyFrom,
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
                                                snapshot.data!.paymentMethod,
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
                                            child: const Text(
                                                "Cheque/Reference",
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
                                            child: const Text("Invoice Number",
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
                                            child: const Text("Invoice Date",
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
                                            child: const Text("Current Balance",
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
                                            child: const Text("Amount Paid",
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
                                            child: Text(
                                                snapshot.data!.chequeNoOrRef
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
                                                snapshot.data!.invoiceDate,
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
                                                snapshot.data!.invoiceNumber
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
                                                snapshot.data!.currentBalance
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
                                                snapshot.data!.amountPaid
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

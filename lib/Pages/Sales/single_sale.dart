import 'package:crm/Service/Sales/sales_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crm/Pages/Sales/sales.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String product = '';
  String supplier = '';
  int imei = 0;
  bool pickedAtShop = false;
  String deliveredBy = '';
  String clientName = '';
  int clientPhoneNumber = 0;
  String clientEmail = '';
  String clientLocation = '';
  String clientPin = '';
  String soldby = '';
  String status = '';
  String warrantyStatus = '';
  int cash = 0;
  int mpesa = 0;
  int invoicedAmount = 0;
  String expenseName = '';
  int expenseAmount = 0;

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
                      FutureBuilder(
                          future: Salesservice().getSingleSale(widget.id),
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
                                    onPressed: () {
                                      TextEditingController productController =
                                          TextEditingController(
                                              text: snapshot.data!.product);
                                      TextEditingController supplierController =
                                          TextEditingController(
                                              text: snapshot.data!.supplier);
                                      TextEditingController imeiController =
                                          TextEditingController(
                                              text: snapshot.data!.imei
                                                  .toString());
                                      TextEditingController
                                          deliveredByController =
                                          TextEditingController(
                                              text: snapshot.data!.deliveredBy);
                                      TextEditingController
                                          clientNameController =
                                          TextEditingController(
                                              text: snapshot.data!.clientName);
                                      TextEditingController
                                          clientPhoneNumberController =
                                          TextEditingController(
                                              text: snapshot
                                                  .data!.clientPhoneNumber
                                                  .toString());
                                      TextEditingController
                                          clientEmailController =
                                          TextEditingController(
                                              text: snapshot.data!.clientEmail);
                                      TextEditingController
                                          clientLocationController =
                                          TextEditingController(
                                              text: snapshot
                                                  .data!.clientLocation);
                                      TextEditingController
                                          clientPinController =
                                          TextEditingController(
                                              text: snapshot.data!.clientPin);
                                      TextEditingController soldByController =
                                          TextEditingController(
                                              text: snapshot.data!.soldBy);
                                      TextEditingController statusController =
                                          TextEditingController(
                                              text: snapshot.data!.status);
                                      TextEditingController
                                          warrantyStatusController =
                                          TextEditingController(
                                              text: snapshot
                                                  .data!.warrantyStatus);
                                      TextEditingController cashController =
                                          TextEditingController(
                                              text: snapshot.data!.cash
                                                  .toString());
                                      TextEditingController mpesaController =
                                          TextEditingController(
                                              text: snapshot.data!.mpesa
                                                  .toString());
                                      TextEditingController
                                          invoicedAmountController =
                                          TextEditingController(
                                              text: snapshot
                                                  .data!.invoicedAmount
                                                  .toString());
                                      TextEditingController
                                          expenseNameController =
                                          TextEditingController(
                                              text: snapshot.data!.expenseName);
                                      TextEditingController
                                          expenseAmountController =
                                          TextEditingController(
                                              text: snapshot.data!.expenseAmount
                                                  .toString());

                                      int activeStepIndex = 0;

                                      List<Step> stepList() => [
                                            Step(
                                                state: activeStepIndex <= 0
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 0,
                                                title: const Text(
                                                    'Product Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Product",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Supplier",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "IMEI",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'IMEI'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Delivered by",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Delivered by'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      deliveredByController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Sold By",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Sold By'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      soldByController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Status",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Status'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      statusController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Picked at shop",
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
                                                          Checkbox(
                                                            value: pickedAtShop,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                pickedAtShop =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Step(
                                                state: activeStepIndex <= 1
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 1,
                                                title: const Text(
                                                    'Client Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Name",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Name'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientNameController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Email",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Email'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientEmailController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Phone Number",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Phone Number'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientPhoneNumberController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Location",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Location'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientLocationController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Pin",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Pin'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientPinController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Step(
                                                state: activeStepIndex <= 2
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 2,
                                                title: const Text(
                                                    'Monetary Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Cash",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Cash'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      cashController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Mpesa",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Mpesa'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      mpesaController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Invoiced Amount",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Invoiced Amount'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      invoicedAmountController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Expense Name",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Expense Name'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      expenseNameController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Expense Amount",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Expense Amount'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      expenseAmountController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Warranty Status",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Warranty Status'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      warrantyStatusController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ];

                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                                title: const Text("Edit Sale"),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                content: StatefulBuilder(
                                                  builder: (context, setState) {
                                                    var height =
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height;
                                                    var width =
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width;

                                                    return SizedBox(
                                                        height: height - 100,
                                                        width: width - 500,
                                                        child: Stepper(
                                                          steps: stepList(),
                                                          type: StepperType
                                                              .horizontal,
                                                          currentStep:
                                                              activeStepIndex,
                                                          onStepContinue: () {
                                                            if (activeStepIndex <
                                                                (stepList()
                                                                        .length -
                                                                    1)) {
                                                              setState(() {
                                                                activeStepIndex +=
                                                                    1;
                                                              });
                                                            } else if (activeStepIndex ==
                                                                (stepList()
                                                                        .length -
                                                                    1)) {
                                                              Navigator.pop(
                                                                  ctx);
                                                              product =
                                                                  productController
                                                                      .text;
                                                              supplier =
                                                                  supplierController
                                                                      .text;
                                                              imei = int.parse(
                                                                  imeiController
                                                                      .text);
                                                              pickedAtShop =
                                                                  true;
                                                              deliveredBy =
                                                                  deliveredByController
                                                                      .text;
                                                              clientName =
                                                                  clientNameController
                                                                      .text;
                                                              clientPhoneNumber =
                                                                  int.parse(
                                                                      clientPhoneNumberController
                                                                          .text);
                                                              clientEmail =
                                                                  clientEmailController
                                                                      .text;
                                                              clientLocation =
                                                                  clientLocationController
                                                                      .text;
                                                              clientPin =
                                                                  clientPinController
                                                                      .text;
                                                              soldby =
                                                                  soldByController
                                                                      .text;
                                                              status =
                                                                  statusController
                                                                      .text;
                                                              warrantyStatus =
                                                                  warrantyStatusController
                                                                      .text;
                                                              cash = int.parse(
                                                                  cashController
                                                                      .text);
                                                              mpesa = int.parse(
                                                                  mpesaController
                                                                      .text);
                                                              invoicedAmount =
                                                                  int.parse(
                                                                      invoicedAmountController
                                                                          .text);
                                                              expenseName =
                                                                  expenseNameController
                                                                      .text;
                                                              expenseAmount =
                                                                  int.parse(
                                                                      expenseAmountController
                                                                          .text);
                                                              Salesservice().editSale(
                                                                  widget.id,
                                                                  product,
                                                                  supplier,
                                                                  imei,
                                                                  pickedAtShop,
                                                                  deliveredBy,
                                                                  clientName,
                                                                  clientPhoneNumber,
                                                                  clientEmail,
                                                                  clientLocation,
                                                                  clientPin,
                                                                  soldby,
                                                                  status,
                                                                  warrantyStatus,
                                                                  cash,
                                                                  mpesa,
                                                                  invoicedAmount,
                                                                  expenseName,
                                                                  expenseAmount);
                                                              Navigator.pop(
                                                                  ctx);
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          const Sales()));
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          onStepCancel: () {
                                                            setState(() {
                                                              activeStepIndex >
                                                                      0
                                                                  ? activeStepIndex -=
                                                                      1
                                                                  : Navigator
                                                                      .pop(ctx);
                                                            });
                                                          },
                                                          onStepTapped:
                                                              (int value) {
                                                            setState(() {
                                                              activeStepIndex =
                                                                  value;
                                                            });
                                                          },
                                                        ));
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
                                    onPressed: () {
                                      TextEditingController productController =
                                          TextEditingController();
                                      TextEditingController supplierController =
                                          TextEditingController();
                                      TextEditingController imeiController =
                                          TextEditingController();
                                      TextEditingController
                                          deliveredByController =
                                          TextEditingController();
                                      TextEditingController
                                          clientNameController =
                                          TextEditingController();
                                      TextEditingController
                                          clientPhoneNumberController =
                                          TextEditingController();
                                      TextEditingController
                                          clientEmailController =
                                          TextEditingController();
                                      TextEditingController
                                          clientLocationController =
                                          TextEditingController();
                                      TextEditingController
                                          clientPinController =
                                          TextEditingController();
                                      TextEditingController soldByController =
                                          TextEditingController();
                                      TextEditingController statusController =
                                          TextEditingController();
                                      TextEditingController
                                          warrantyStatusController =
                                          TextEditingController();
                                      TextEditingController cashController =
                                          TextEditingController();
                                      TextEditingController mpesaController =
                                          TextEditingController();
                                      TextEditingController
                                          invoicedAmountController =
                                          TextEditingController();
                                      TextEditingController
                                          expenseNameController =
                                          TextEditingController();
                                      TextEditingController
                                          expenseAmountController =
                                          TextEditingController();

                                      int activeStepIndex = 0;

                                      List<Step> stepList() => [
                                            Step(
                                                state: activeStepIndex <= 0
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 0,
                                                title: const Text(
                                                    'Product Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Product",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Supplier",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "IMEI",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'IMEI'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Delivered by",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Delivered by'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      deliveredByController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Sold By",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Sold By'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      soldByController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Status",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Status'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      statusController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 2,
                                                                    bottom: 5),
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: const Row(
                                                              children: [
                                                                Text(
                                                                  "Picked at shop",
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
                                                          Checkbox(
                                                            value: pickedAtShop,
                                                            onChanged:
                                                                (bool? value) {
                                                              setState(() {
                                                                pickedAtShop =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Step(
                                                state: activeStepIndex <= 1
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 1,
                                                title: const Text(
                                                    'Client Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Name",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Name'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientNameController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Email",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Email'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientEmailController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Phone Number",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Phone Number'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientPhoneNumberController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Location",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Location'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientLocationController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Client Pin",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Client Pin'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      clientPinController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                            Step(
                                                state: activeStepIndex <= 2
                                                    ? StepState.editing
                                                    : StepState.complete,
                                                isActive: activeStepIndex >= 2,
                                                title: const Text(
                                                    'Monetary Details'),
                                                content: Center(
                                                  child: Column(
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Cash",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Cash'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      cashController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Mpesa",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Mpesa'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      mpesaController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Invoiced Amount",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Invoiced Amount'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      invoicedAmountController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Expense Name",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Expense Name'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      expenseNameController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Expense Amount",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Expense Amount'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      expenseAmountController,
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
                                                                        bottom:
                                                                            5),
                                                                width: 330,
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child:
                                                                    const Row(
                                                                  children: [
                                                                    Text(
                                                                      "Warranty Status",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "*",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.red),
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
                                                                          borderRadius: BorderRadius.circular(
                                                                              10.0)),
                                                                      labelText:
                                                                          'Warranty Status'),
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      warrantyStatusController,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ))
                                          ];

                                      showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                                title: const Text("Edit Sale"),
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                content: StatefulBuilder(
                                                  builder: (context, setState) {
                                                    var height =
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height;
                                                    var width =
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width;

                                                    return SizedBox(
                                                        height: height - 100,
                                                        width: width - 500,
                                                        child: Stepper(
                                                          steps: stepList(),
                                                          type: StepperType
                                                              .horizontal,
                                                          currentStep:
                                                              activeStepIndex,
                                                          onStepContinue: () {
                                                            if (activeStepIndex <
                                                                (stepList()
                                                                        .length -
                                                                    1)) {
                                                              setState(() {
                                                                activeStepIndex +=
                                                                    1;
                                                              });
                                                            } else if (activeStepIndex ==
                                                                (stepList()
                                                                        .length -
                                                                    1)) {
                                                              Navigator.pop(
                                                                  ctx);
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          onStepCancel: () {
                                                            setState(() {
                                                              activeStepIndex >
                                                                      0
                                                                  ? activeStepIndex -=
                                                                      1
                                                                  : Navigator
                                                                      .pop(ctx);
                                                            });
                                                          },
                                                          onStepTapped:
                                                              (int value) {
                                                            setState(() {
                                                              activeStepIndex =
                                                                  value;
                                                            });
                                                          },
                                                        ));
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
                                Text("Delete Sale",
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

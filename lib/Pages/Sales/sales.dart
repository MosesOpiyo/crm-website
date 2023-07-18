// ignore_for_file: file_names

import 'package:crm/Pages/Sales/single_sale.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crm/Service/Sales/sales_service.dart';
import 'package:crm/Service/User/user_service.dart';
import 'package:crm/sub_components/side_nav.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Sales extends StatelessWidget {
  static const String route = '/DashBoard/Sales';

  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
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

  String dropdownvalue = 'At The Shop';

  // List of items in our dropdown menu

  TextEditingController productController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController imeiController = TextEditingController();
  TextEditingController pickedAtShopController = TextEditingController();
  TextEditingController deliveredByController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientPhoneNumberController = TextEditingController();
  TextEditingController clientEmailController = TextEditingController();
  TextEditingController clientLocationController = TextEditingController();
  TextEditingController clientPinController = TextEditingController();
  TextEditingController soldByController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController warrantyStatusController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  TextEditingController mpesaController = TextEditingController();
  TextEditingController invoicedAmountController = TextEditingController();
  TextEditingController expenseNameController = TextEditingController();
  TextEditingController expenseAmountController = TextEditingController();

  var formatter = NumberFormat('###,###,000');

  newSalesForm() {
    int activeStepIndex = 0;

    List<Step> stepList() => [
          Step(
              state:
                  activeStepIndex <= 0 ? StepState.editing : StepState.complete,
              isActive: activeStepIndex >= 0,
              title: const Text('Product Details'),
              content: Center(
                child: Column(
                  children: [
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
                                    "Product",
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
                                    labelText: 'Product'),
                                keyboardType: TextInputType.text,
                                controller: productController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Supplier",
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
                                    labelText: 'Supplier'),
                                keyboardType: TextInputType.text,
                                controller: supplierController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "IMEI",
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
                                    labelText: 'IMEI'),
                                keyboardType: TextInputType.text,
                                controller: imeiController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Delivered by",
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
                                    labelText: 'Delivered by'),
                                keyboardType: TextInputType.text,
                                controller: deliveredByController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "Sold By",
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
                                    labelText: 'Sold By'),
                                keyboardType: TextInputType.text,
                                controller: soldByController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Status",
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
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 122, 122, 122))),
                                width: 330,
                                height: 55,
                                padding: const EdgeInsets.only(left: 10),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return DropdownButton(
                                      value: dropdownvalue,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      items: <String>[
                                        'At The Shop',
                                        'Sold',
                                        'Invoiced',
                                        'returned',
                                      ].map((String item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                          statusController.text = newValue;
                                        });
                                      },
                                    );
                                  },
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 2, bottom: 5),
                          alignment: Alignment.centerLeft,
                          child: const Row(
                            children: [
                              Text(
                                "Picked at shop",
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
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Checkbox(
                              value: pickedAtShop,
                              onChanged: (bool? value) {
                                setState(() {
                                  pickedAtShop = value!;
                                  pickedAtShopController.text =
                                      value.toString();
                                });
                              },
                            );
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              )),
          Step(
              state:
                  activeStepIndex <= 1 ? StepState.editing : StepState.complete,
              isActive: activeStepIndex >= 1,
              title: const Text('Client Details'),
              content: Center(
                child: Column(
                  children: [
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
                                    "Client Name",
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
                                    labelText: 'Client Name'),
                                keyboardType: TextInputType.text,
                                controller: clientNameController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Client Email",
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
                                    labelText: 'Client Email'),
                                keyboardType: TextInputType.text,
                                controller: clientEmailController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "Client Phone Number",
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
                                    labelText: 'Client Phone Number'),
                                keyboardType: TextInputType.text,
                                controller: clientPhoneNumberController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Client Location",
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
                                    labelText: 'Client Location'),
                                keyboardType: TextInputType.text,
                                controller: clientLocationController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "Client Pin",
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
                                    labelText: 'Client Pin'),
                                keyboardType: TextInputType.text,
                                controller: clientPinController,
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
              state:
                  activeStepIndex <= 2 ? StepState.editing : StepState.complete,
              isActive: activeStepIndex >= 2,
              title: const Text('Monetary Details'),
              content: Center(
                child: Column(
                  children: [
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
                                    "Cash",
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
                                    labelText: 'Cash'),
                                keyboardType: TextInputType.text,
                                controller: cashController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Mpesa",
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
                                    labelText: 'Mpesa'),
                                keyboardType: TextInputType.text,
                                controller: mpesaController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "Invoiced Amount",
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
                                    labelText: 'Invoiced Amount'),
                                keyboardType: TextInputType.text,
                                controller: invoicedAmountController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Expense Name",
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
                                    labelText: 'Expense Name'),
                                keyboardType: TextInputType.text,
                                controller: expenseNameController,
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
                                  const EdgeInsets.only(left: 2, bottom: 5),
                              width: 330,
                              alignment: Alignment.centerLeft,
                              child: const Row(
                                children: [
                                  Text(
                                    "Expense Amount",
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
                                    labelText: 'Expense Amount'),
                                keyboardType: TextInputType.text,
                                controller: expenseAmountController,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                                    "Warranty Status",
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
                                    labelText: 'Warranty Status'),
                                keyboardType: TextInputType.text,
                                controller: warrantyStatusController,
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
              title: const Text("New Sale"),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: StatefulBuilder(
                builder: (context, setState) {
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return SizedBox(
                      height: height - 100,
                      width: width - 500,
                      child: Stepper(
                        steps: stepList(),
                        type: StepperType.horizontal,
                        currentStep: activeStepIndex,
                        onStepContinue: () {
                          if (activeStepIndex < (stepList().length - 1)) {
                            setState(() {
                              activeStepIndex += 1;
                            });
                          } else if (activeStepIndex ==
                              (stepList().length - 1)) {
                            Navigator.pop(ctx);
                            product = productController.text;
                            supplier = supplierController.text;
                            imei = int.parse(imeiController.text);
                            pickedAtShop = true;
                            deliveredBy = deliveredByController.text;
                            clientName = clientNameController.text;
                            clientPhoneNumber =
                                int.parse(clientPhoneNumberController.text);
                            clientEmail = clientEmailController.text;
                            clientLocation = clientLocationController.text;
                            clientPin = clientPinController.text;
                            soldby = soldByController.text;
                            status = statusController.text;
                            warrantyStatus = warrantyStatusController.text;
                            cash = int.parse(cashController.text);
                            mpesa = int.parse(mpesaController.text);
                            invoicedAmount =
                                int.parse(invoicedAmountController.text);
                            expenseName = expenseNameController.text;
                            expenseAmount =
                                int.parse(expenseAmountController.text);
                            Salesservice().postSale(
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Sales()));
                          } else {
                            return;
                          }
                        },
                        onStepCancel: () {
                          setState(() {
                            activeStepIndex > 0
                                ? activeStepIndex -= 1
                                : Navigator.pop(ctx);
                          });
                        },
                        onStepTapped: (int value) {
                          setState(() {
                            activeStepIndex = value;
                          });
                        },
                      ));
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
            Column(
              children: [
                SizedBox(
                  width: size.width,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        child: const Text(
                          "Sales Panel",
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
                            child: Column(
                              children: [
                                const Text("Sales",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                FutureBuilder(
                                    future: Salesservice().getSalesValue(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "Ksh ${formatter.format(snapshot.data[0])}",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      } else {
                                        return const Text("Ksh 0",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      }
                                    })
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
                            child: Column(
                              children: [
                                const Text("Sold Units",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                FutureBuilder(
                                    future: Salesservice().getSales(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "${snapshot.data.length} Units",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      } else {
                                        return const Text("0 Units",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      }
                                    })
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
                            child: Column(
                              children: [
                                const Text("Units At Shop",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                FutureBuilder(
                                    future: Salesservice().getSalesAtShop(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "${snapshot.data.length} Units",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      } else {
                                        return const Text("0 Units",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      }
                                    })
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
                            child: Column(
                              children: [
                                const Text("Clients",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    )),
                                FutureBuilder(
                                    future: Salesservice().getSalesClients(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                            "${snapshot.data.length} Clients",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      } else {
                                        return const Text("0 Clients",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ));
                                      }
                                    })
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
                                newSalesForm();
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
              ],
            ),
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    width: size.width,
                    height: size.height * .6,
                    child: FutureBuilder(
                        future: Salesservice().getSales(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: Colors.yellow),
                              child: ListView(
                                  scrollDirection: Axis.vertical,
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
                                        rows: List.generate(
                                            snapshot.data!.length, (index) {
                                          var data = snapshot.data![index];
                                          return DataRow(
                                              onSelectChanged: (value) {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
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
                                                  Text(data.invoicedAmount
                                                      .toString()),
                                                ),
                                              ]);
                                        }).toList()),
                                  ]),
                            );
                          } else {
                            return const Text("No data");
                          }
                        }))
              ],
            )
          ],
        ));
  }
}

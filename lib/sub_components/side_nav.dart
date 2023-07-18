import 'package:crm/Pages/Invoice/invoices.dart';
import 'package:crm/Pages/Reports/suppliers.dart';
import 'package:crm/Pages/Sales/sales.dart';
import 'package:crm/Pages/Service_centers/service_centers.dart';
import 'package:crm/Pages/Stocks/stock.dart';
import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.zero,
      height: size.height,
      width: size.width * .2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 200,
            height: 100,
            child: const Column(children: [
              Text(
                "Phones and Tablets",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              )
            ]),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Sales.route);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 120),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.money_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Sales",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Stocks.route);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 120),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Stock",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ServiceCenters.route);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 50),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.settings_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Service Centers",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Suppliers.route);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 100),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.report_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Reports",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Invoices.route);
            },
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 95),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.receipt_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Invoices",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
                alignment: Alignment.centerLeft,
                width: size.width * .2,
                height: 60,
                padding: const EdgeInsets.only(right: 95),
                child: const Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.logout_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(right: 5)),
                    Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

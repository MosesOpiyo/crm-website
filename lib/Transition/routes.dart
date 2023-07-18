import 'package:crm/Pages/Invoice/invoices.dart';
import 'package:crm/Pages/Reports/clients.dart';
import 'package:crm/Pages/Reports/products.dart';
import 'package:crm/Pages/Reports/suppliers.dart';
import 'package:crm/Pages/Sales/single_sale.dart';
import 'package:crm/Pages/Service_centers/service_centers.dart';
import 'package:crm/Transition/fade_transition.dart';
import 'package:crm/Authentication/Login.dart';
import 'package:crm/Pages/Sales/sales.dart';
import 'package:crm/Pages/Stocks/stock.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Login.route:
        return FadeRoute(page: const Login());
      case Sales.route:
        return FadeRoute(page: const Sales());
      case SingleSale.route:
        var id = int.parse(settings.arguments as String);
        return FadeRoute(page: SingleSale(saleId: id));
      case Stocks.route:
        return FadeRoute(page: const Stocks());
      case ServiceCenters.route:
        return FadeRoute(page: const ServiceCenters());
      case Suppliers.route:
        return FadeRoute(page: const Suppliers());
      case Clients.route:
        return FadeRoute(page: const Clients());
      case Products.route:
        return FadeRoute(page: const Products());
      case Invoices.route:
        return FadeRoute(page: const Invoices());
    }
    return null;
  }
}

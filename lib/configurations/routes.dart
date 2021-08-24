import 'package:flutter/material.dart';
import 'package:shopbox_task/pages/branchesPage/branches.view.dart';
import 'package:shopbox_task/pages/clientsPage/clients.view.dart';
import 'package:shopbox_task/pages/productsPage/products.view.dart';
import '../pages/loginPage/login.view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    List<String> _routeParams = settings.name!.split("/");
    switch (_routeParams[1]) {
      case 'login':
        return MaterialPageRoute<dynamic>(
            builder: (_) => Login(), settings: settings);
      case 'clients':
        return MaterialPageRoute<dynamic>(
            builder: (_) => ClientsPage(), settings: settings);
      case 'branches':
        return MaterialPageRoute<dynamic>(
            builder: (_) => BranchesPage(_routeParams[2]), settings: settings);
      case 'products':
        return MaterialPageRoute<dynamic>(
            builder: (_) => ProductsPage(_routeParams[2],_routeParams[3]), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Login(), settings: settings);
    }
  }
}

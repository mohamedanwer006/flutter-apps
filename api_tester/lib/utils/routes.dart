import 'package:api_tester/pages/home_page.dart';
import 'package:api_tester/pages/json_file_request.dart';
import 'package:api_tester/pages/multi_path_page.dart';
import 'package:api_tester/pages/multi_requests_page.dart';
import 'package:api_tester/pages/single_requests_page.dart';
import 'package:flutter/material.dart';

class MyRouteImplementation {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());

      case JsonFileRequestPage.routeName:
        return MaterialPageRoute(builder: (_) => const JsonFileRequestPage());

      case SingleRequestPage.routeName:
        return MaterialPageRoute(builder: (_) => const SingleRequestPage());
      case MutliRequestsPage.routeName:
        return MaterialPageRoute(builder: (_) => const MutliRequestsPage());
      case MultiPathPage.routeName:
        return MaterialPageRoute(builder: (_) => const MultiPathPage());

      default:
        throw ('the route ${routeSettings.name}}is wrong check the correct rout name');
    }
  }
}

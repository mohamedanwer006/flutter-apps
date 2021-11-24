import 'package:algorithm_v/src/pages/home.dart';
import 'package:algorithm_v/src/pages/sort_view.dart';
import 'package:algorithm_v/src/sample_feature/sample_item_details_view.dart';
import 'package:algorithm_v/src/sample_feature/sample_item_list_view.dart';
import 'package:algorithm_v/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class CustomRoute {
  static MaterialPageRoute<void> ongenrateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case Home.routeName:
            return Home();
          case SortView.routeName:
            return SortView();
          // case SampleItemDetailsView.routeName:
          //   return const SampleItemDetailsView();
          // case SampleItemListView.routeName:
          //   case SettingsView.routeName:
          //   return SettingsView(controller: settingsController);
          // case SampleItemDetailsView.routeName:
          //   return const SampleItemDetailsView();
          // case SampleItemListView.routeName:
          default:
            return const SampleItemListView();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';

import 'screens/input_page.dart';
import 'screens/results_page.dart';

class Routes {
  static const kHome = '/';
  static const kResults = '/results';
}

final Map<String, Widget Function(BuildContext)> routesMap = {
  Routes.kHome: (context) => InputPage(),
  Routes.kResults: (context) => ResultsPage(),
};

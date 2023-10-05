import 'package:flutter/widgets.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/routing/router.dart';
import 'package:rumbuk_web/routing/routes.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: overViewPageRoute,
  onGenerateRoute: generateRoute,
);
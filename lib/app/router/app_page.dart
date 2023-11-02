import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/router/app_router.dart';
import 'package:flutter_application_1/app/view/Homepage.dart';

class Apppages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context) => Home(),
  };
}

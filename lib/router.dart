import 'package:challenge/pages/home.dart';
import 'package:challenge/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
class FluroRouter {
  static Router router = Router();
  static Handler _homeHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomePage());
  static Handler _settingsHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => SettingsPage());
  static void setupRouter() {
    router.define(
      'home',
      handler: _homeHandler,
    );
    router.define(
      'settings',
      handler: _settingsHandler,
    );
  }
}
import 'package:challenge/router.dart';
import 'package:challenge/util/theme_notifier.dart';
import 'package:challenge/values/strings.dart';
import 'package:challenge/values/theme.dart';
import 'package:challenge/values/themes/dark_blue_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  // To fix the sharedPreferences
  WidgetsFlutterBinding.ensureInitialized();
  FluroRouter.setupRouter();
  SharedPreferences.getInstance().then((prefs) {
  var darkModeOn = prefs.getBool('darkMode') ?? true;
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(darkModeOn ? darkBlueTheme : lightTheme),
    child: Challenge(),
  ));
  });
}

class Challenge extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: Strings.titleApp,
      theme: themeNotifier.getTheme(),
      initialRoute: 'home',
      onGenerateRoute: FluroRouter.router.generator
    );
  }
}


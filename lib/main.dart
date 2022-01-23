import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app_weather/ui/screens/main_screen.dart';
import 'package:test_app_weather/ui/screens/splash_screen.dart';

import 'constants/language.dart';
import 'constants/styles.dart';
import 'helpers/navigable.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale(Language.EN), Locale(Language.RU)],
        path: 'assets/translations',
        fallbackLocale: Locale(Language.RU)));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Test Weather app',
        theme: ThemeData(
            primaryColor: Styles.k_brand_primary_color,
            disabledColor: Styles.k_disabled,
            backgroundColor: Styles.k_white_color,
            scaffoldBackgroundColor: Styles.k_white_color,
            fontFamily: 'Inter'),
        initialRoute: "/",
        routes: routes(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
  routes() {
    List<Navigable> screens = generateRoutes();
    Map<String, Widget Function(BuildContext)> routes = {};
    screens.forEach((element) {
      routes[element.getName()] = (context) => element;
    });
    return routes;
  }

  List<Navigable> generateRoutes() {
    return [
      SplashScreen(),
      MainScreen()
    ];
  }
}




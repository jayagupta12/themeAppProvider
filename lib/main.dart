import 'package:themes_app/theme/themeprvider.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/styles.dart';
import 'views/home/home_view.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatefulWidget {
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
      return MultiProvider(
        providers: ProviderInjector.providers,
        child: MaterialApp(
          navigatorKey: locator<NavigatorService>().navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          home: HomeView(),
        ),
      );
    }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/Products.dart';
import 'package:flutter_shop/routes/Routes.dart';
import 'package:flutter_shop/screens/tabs.dart';
import 'package:flutter_shop/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({Key?key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: "Shop",
        theme: theme,
        themeMode: ThemeMode.light,
        initialRoute: Tabs.routeName,
        routes: routes(context),
      ),
    );
  }
}

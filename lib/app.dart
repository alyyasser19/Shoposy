import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/Cart.dart';
import 'package:flutter_shop/providers/Products.dart';
import 'package:flutter_shop/routes/Routes.dart';
import 'package:flutter_shop/screens/user/tabs.dart';
import 'package:flutter_shop/theme/theme.dart';
import 'package:provider/provider.dart';

import 'providers/Auth.dart';
import 'screens/Auth/login.dart';

class App extends StatefulWidget {
  const App({Key?key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: "Shopsy",
        theme: theme,
        themeMode: ThemeMode.light,
        initialRoute: Login.routeName,
        routes: routes(context),
      ),
    );
  }
}

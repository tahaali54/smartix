import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/devices.dart';
import 'models/routine.dart';
import 'screens/dashboard.dart';
import 'screens/catalog.dart';
import 'screens/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => DevicesModel()),
        ChangeNotifierProxyProvider<DevicesModel, DashboardModel>(
          create: (context) => DashboardModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smartix with Provider Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const GetStarted(),
          '/catalog': (context) => const Devices(),
          '/cart': (context) => const Dashboard(),
        },
      ),
    );
  }
}

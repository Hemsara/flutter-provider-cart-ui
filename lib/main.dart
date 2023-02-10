// ignore_for_file: prefer_const_constructors

import 'package:cart_ui/provider/cart_provider.dart';
import 'package:cart_ui/provider/product_provider.dart';
import 'package:cart_ui/screens/cart_screen.dart';
import 'package:cart_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => ProductProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
        '/cart': (context) => CartScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
    );
  }
}

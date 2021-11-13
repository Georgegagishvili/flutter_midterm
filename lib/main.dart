import 'package:flutter/material.dart';
import 'package:shop_app_midterm/pages/home.dart';
import 'package:shop_app_midterm/pages/product_add.dart';
import 'package:shop_app_midterm/pages/product_detailed.dart';
import 'package:shop_app_midterm/pages/product_edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/',
      routes: {
        "/" : (ctx) => const HomePage(),
        "/product_detailed" : (ctx) => const ProductDetailedPage(),
        '/product_add' : (ctx) => const ProductAddPage(),
        '/product_edit' : (ctx) => const ProductEditPage(),
      },
    );
  }
}

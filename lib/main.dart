import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/pages/home_Page.dart';
import 'package:store_app/pages/update_page.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}

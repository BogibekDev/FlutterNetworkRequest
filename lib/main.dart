import 'package:flutter/material.dart';
import 'package:network_request/pages/create_page.dart';
import 'package:network_request/pages/detail_page.dart';
import 'package:network_request/pages/edit_page.dart';
import 'package:network_request/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DetailPage.id: (context) => DetailPage(),
        EditPage.id: (context) => EditPage(),
        CreatePage.id: (context) => CreatePage(),
      },
    );
  }
}

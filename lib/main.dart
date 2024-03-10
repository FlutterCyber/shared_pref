import 'package:flutter/material.dart';
import 'package:shared_pref/news_page.dart';
import 'package:shared_pref/user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NewsPage(),
      routes: {
        UserPage.id: (context) => const UserPage(),
        NewsPage.id: (context) => const NewsPage(),
      },
    );
  }
}

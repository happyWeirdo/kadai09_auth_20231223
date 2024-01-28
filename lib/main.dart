import 'package:flutter/material.dart';
// import 'package:my_favorite_app/models/favorites.dart';
import 'package:provider/provider.dart';
import 'models/favorites.dart';
import 'pages/intro_page.dart';
// import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favorites(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: IntroPage(),
      // home: LoginPage(),
  }
}
import 'package:flutter/material.dart';
import 'package:latihan_kuis_prak_mobile_124230016/screens/login_page.dart';
import 'package:latihan_kuis_prak_mobile_124230016/screens/home_page.dart';
import 'package:latihan_kuis_prak_mobile_124230016/screens/detail_page.dart';
import 'package:latihan_kuis_prak_mobile_124230016/screens/profile_page.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.pink, // pastel theme
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/detail': (context) => const DetailPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => HomePage(username: username),
          );
        }
        if (settings.name == '/profile') {
          final username = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ProfilePage(username: username),
          );
        }
        return null;
      },
    );
  }
}

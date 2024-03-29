import 'package:flutter/material.dart';
import 'package:master_rad_flutter/screens/profile_screen.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App Flutter',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SearchScreen.routeName: (context) => const SearchScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreenWidget(),
      },
    );
  }
}
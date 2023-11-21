import 'package:flutter/material.dart';
import 'package:master_rad_flutter/models/article_model.dart';
import 'package:master_rad_flutter/screens/screens.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const BottomNavBar(index: 0),
        body: Container());
  }

  const ProfileScreen({Key? key}) : super(key: key);
}

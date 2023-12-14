import 'package:flutter/material.dart';
import 'package:master_rad_flutter/models/article_model.dart';
import 'package:master_rad_flutter/screens/screens.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';
import 'package:device_preview/device_preview.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 2),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: const Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    child: Icon(Icons.account_circle_rounded),
                  )
                )
              ],
            ),
          )
      ),
    );
  }

  const ProfileScreen({super.key});
}

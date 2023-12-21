import 'package:flutter/material.dart';
import 'package:master_rad_flutter/models/article_model.dart';
import 'package:master_rad_flutter/screens/screens.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';
import 'package:device_preview/device_preview.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  static const profileImage = "assets/images/profile_image.jpg";

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
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              alignment: Alignment.center,
              child: const Image(image: AssetImage(profileImage)),
            )
          ],
        ),
      )),
    );
  }

  const ProfileScreen({super.key});
}

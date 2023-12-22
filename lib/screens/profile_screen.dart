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
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 2),
      body: Container(
        margin: const EdgeInsets.only(left: 95),
        height: 220,
        width: 220,
        padding: const EdgeInsets.all(24),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            const CircleAvatar(backgroundImage: AssetImage(profileImage)),
            Positioned(
                bottom: -10,
                right: -20,
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: const Color(0xFFF5F6F9),
                  padding: const EdgeInsets.all(15.0),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.edit, color: Colors.black26),
                ))
          ],
        ),
      ),
    );
  }

  const ProfileScreen({super.key});
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_nav_bar.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => ProfileScreen();
}

class ProfileScreen extends State<ProfileScreenWidget> {
  static const prefsKeyName = "PREFS_KEY_NAME";
  static const routeName = '/profile';
  static const profileImage = "assets/images/profile_image.jpg";

  String name = "Naum Djordjeviccc";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString(prefsKeyName) ?? "Naum Djordjevic";
  }

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
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              height: 200,
              width: 200,
              padding: const EdgeInsets.all(24),
              child: Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  const CircleAvatar(backgroundImage: AssetImage(profileImage)),
                  Positioned(
                      bottom: -10,
                      right: -25,
                      child: RawMaterialButton(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString(prefsKeyName, "${name}1");
                        },
                        elevation: 2.0,
                        fillColor: const Color(0xFFF5F6F9),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        child: const Icon(Icons.edit, color: Colors.black26),
                      ))
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text("Full name",
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                                10))),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize ??
                            13))),
            const SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text("Job title",
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                                10))),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text("Software engineer",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize ??
                            13))),
            const SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text("E-mail",
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                                10))),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text("naumdj@yahoo.com",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize ??
                            13))),
            const SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10),
                child: Text("Phone number",
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium?.fontSize ??
                                10))),
            Container(
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text("0601234567",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.fontSize ??
                            13))),
            const SizedBox(height: 20),
          ])),
    );
  }
}

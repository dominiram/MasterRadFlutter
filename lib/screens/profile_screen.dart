import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => ProfileScreen();
}

class ProfileScreen extends State<ProfileScreenWidget> {
  late TextEditingController nameTextController;
  late TextEditingController headlineTextController;
  late TextEditingController emailTextController;
  late TextEditingController phoneNumberTextController;

  static const prefsKeyName = "PREFS_KEY_NAME";
  static const prefsKeyHeadline = "PREFS_KEY_HEADLINE";
  static const prefsKeyEmail = "PREFS_KEY_EMAIL";
  static const prefsKeyPhoneNumber = "PREFS_KEY_PHONE_NUMBER";
  static const prefsKeyProfileImagePath = "PREFS_KEY_PROFILE_IMAGE_PATH";
  static const routeName = '/profile';
  static const profileImage = "assets/images/profile_image.jpg";
  File? imageFile;

  late String name = "Naum";
  late String headline = "Software developer";
  late String email = "abc@gmail.com";
  late String phoneNumber = "060123456";
  late String? profileImagePath = null;

  @override
  void initState() {
    loadData();
    nameTextController = TextEditingController();
    nameTextController.text = name;

    headlineTextController = TextEditingController();
    headlineTextController.text = headline;

    emailTextController = TextEditingController();
    emailTextController.text = email;

    phoneNumberTextController = TextEditingController();
    phoneNumberTextController.text = phoneNumber;

    if (profileImagePath != null) imageFile = File(profileImagePath!);
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    headlineTextController.dispose();
    emailTextController.dispose();
    phoneNumberTextController.dispose();
    super.dispose();
  }

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      name = prefs.getString(prefsKeyName) ?? "Naum Djordjevic";
      headline = prefs.getString(prefsKeyHeadline) ?? "Software developer";
      email = prefs.getString(prefsKeyEmail) ?? "abc@gmail.com";
      phoneNumber = prefs.getString(prefsKeyPhoneNumber) ?? "060123456";
      profileImagePath = prefs.getString(prefsKeyProfileImagePath);

      nameTextController.text = name;
      headlineTextController.text = headline;
      emailTextController.text = email;
      phoneNumberTextController.text = phoneNumber;
      if (profileImagePath != null) imageFile = File(profileImagePath!);
    });
  }

  Future pickImageFromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    profileImagePath = pickedImage!.path;

    if (profileImagePath != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(prefsKeyProfileImagePath, profileImagePath!);
    }

    setState(() {
      imageFile = File(profileImagePath!);
    });
  }

  Future saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = nameTextController.text;
      headline = headlineTextController.text;
      email = emailTextController.text;
      phoneNumber = phoneNumberTextController.text;

      prefs.setString(prefsKeyName, name);
      prefs.setString(prefsKeyHeadline, headline);
      prefs.setString(prefsKeyEmail, email);
      prefs.setString(prefsKeyPhoneNumber, phoneNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false),
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
                  imageFile != null
                      ? ClipOval(
                          child: Image.file(
                          imageFile!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        ))
                      : const CircleAvatar(
                          backgroundImage: AssetImage(profileImage)),
                  Positioned(
                      bottom: -10,
                      right: -25,
                      child: RawMaterialButton(
                        onPressed: () async {
                          pickImageFromGallery();
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
                margin: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              13),
                  controller: nameTextController,
                )),
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
                margin: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              13),
                  controller: headlineTextController,
                )),
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
                margin: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              13),
                  controller: emailTextController,
                )),
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
                margin: const EdgeInsets.only(left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize:
                          Theme.of(context).textTheme.headlineSmall?.fontSize ??
                              13),
                  controller: phoneNumberTextController,
                )),
            const SizedBox(height: 20),
            Container(
                height: 50,
                margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
                child: ElevatedButton(
                    onPressed: () async {
                      saveUserDetails();
                    },
                    child: Center(
                        child: Text(
                      "Save user data",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize ??
                              13),
                    ))))
          ])),
    );
  }
}

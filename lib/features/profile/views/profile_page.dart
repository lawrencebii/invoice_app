import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invoice_app/features/authentication/authentication_provider.dart';
import 'package:invoice_app/features/profile/components/action_card.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:invoice_app/utils/petite_storage.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = jsonDecode(StorageUtil.getString(key: 'user'));
  String getName() {
    try {
      return user['name'];
    } catch (e) {
      return StorageUtil.getString(key: 'name');
    }
  }

  String getEmail() {
    try {
      return user['email'];
    } catch (e) {
      return StorageUtil.getString(key: 'email');
    }
  }

  String getAddress() {
    try {
      return user['address'];
    } catch (e) {
      return StorageUtil.getString(key: 'address');
    }
  }

  String getPhone() {
    try {
      return user['phone'];
    } catch (e) {
      return StorageUtil.getString(key: 'phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    var spaceY = SizedBox(
      height: pH(20, context),
    );
    return Scaffold(
      backgroundColor: profileBackground,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: profileBackground,
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<LocalAuthenticationProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spaceY,
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Profile",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      height: pH(150, context),
                      width: pH(150, context),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: profileAvatar,
                      ),
                      child: Center(
                        child: Text(
                          getName().split(' ').first[0],
                          style: const TextStyle(fontSize: 34),
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   getName(),
                  //   textAlign: TextAlign.start,
                  //   style: const TextStyle(
                  //     fontSize: 22,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // Text(
                  //   getEmail(),
                  //   textAlign: TextAlign.start,
                  //   style: const TextStyle(
                  //     fontSize: 17,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.w300,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Name",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getName(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Divider(),
                  ],
                  SizedBox(
                    height: 20,
                  ),
                  ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getEmail(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Divider(),
                  ],
                  SizedBox(
                    height: 20,
                  ),
                  ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Address",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getAddress(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Divider(),
                  ],
                  SizedBox(
                    height: 20,
                  ),
                  ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        getPhone(),
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Divider(),
                  ],
                  SizedBox(
                    height: 40,
                  ),
                  // const ActionCard(tag: "Contact Info", svg: 'contact'),

                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Logout'),
                              content: const Text(
                                  'Are you sure you want to logout?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: const Text('Logout'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context
                                        .read<LocalAuthenticationProvider>()
                                        .logout(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Logout ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ).animate().fadeIn(),
            );
          },
        ),
      ),
    );
  }
}

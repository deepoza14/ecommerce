// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:masysecommerce/models/comingsoonalert.dart';
import 'package:masysecommerce/models/mapscreen.dart';
import 'package:masysecommerce/models/privacyalert.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/homepage.dart';
import 'package:masysecommerce/screens/navbar.dart';
import 'package:masysecommerce/screens/orders.dart';
import 'package:masysecommerce/screens/settings.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 55,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BottomNavigationScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Home",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Cart",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrderScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.local_shipping,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Track Orders",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                "Account",
                style: TextStyle(),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.person_outlined,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Settings",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                "General",
                style: TextStyle(),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MapScreen()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.star_rate_outlined,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Rate Us",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const PrivacyPolicyDialog();
                  },
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              child: Text(
                "Logout",
                style: TextStyle(),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ComingSoonDialog();
                  },
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: MyColorTheme.primaryColor,
                  size: 30,
                ),
                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Logout",
                    style: TextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

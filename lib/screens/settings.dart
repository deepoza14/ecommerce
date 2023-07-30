import 'package:flutter/material.dart';
import 'package:masysecommerce/login/login.dart';
import 'package:masysecommerce/models/comingsoonalert.dart';
import 'package:masysecommerce/models/privacyalert.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/drawer.dart';
import 'package:masysecommerce/screens/orders.dart';
import 'package:masysecommerce/screens/savedaddress.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationSwitchValue = false; // Variable to hold the switch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.dashboard_sharp,
                color: MyColorTheme.primaryColor,
              ),
            );
          },
        ),
        title: SizedBox(
          width: 120,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WishListScreen()),
              );
            },
            icon: const Icon(Icons.favorite),
            color: MyColorTheme.primaryColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: MyColorTheme.primaryColor,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Account Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderScreen()));
                },
                child: const ListTile(
                  leading: Icon(Icons.shopping_bag_rounded),
                  title: Text(
                    "My Orders",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.notifications_none),
                title: const Text(
                  "Notification",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  activeColor: MyColorTheme.primaryColor,
                  value: notificationSwitchValue,
                  onChanged: (bool value) {
                    // Update the switch state
                    setState(() {
                      notificationSwitchValue = value;
                    });
                  },
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
                child: const ListTile(
                  leading: Icon(Icons.reviews),
                  title: Text(
                    "Reviews",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SavedAddress()));
                },
                child: const ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    "Saved Addresses",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
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
                child: const ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text(
                    "Rate the app",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () async {
                  var phoneNumber = "+918097455577";
                  final Uri urlwhats =
                      Uri.parse("whatsapp://send?phone=$phoneNumber");
                  if (!await launchUrl(urlwhats)) {
                    throw Exception('Could not launch $urlwhats');
                  }
                },
                child: const ListTile(
                  leading: Icon(Icons.support_agent),
                  title: Text(
                    "Get in Touch",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
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
                child: const ListTile(
                  leading: Icon(Icons.inventory_outlined),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              InkWell(
                onTap: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                },
                child: const ListTile(
                  leading: Icon(Icons.share),
                  title: Text(
                    "Share the app",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

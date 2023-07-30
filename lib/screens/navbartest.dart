import 'package:flutter/material.dart';
import 'package:masysecommerce/screens/homepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:masysecommerce/screens/orders.dart';
import 'package:masysecommerce/screens/settings.dart';
import 'package:masysecommerce/screens/shop.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class NavBarTest extends StatefulWidget {
  const NavBarTest({super.key});

  @override
  _NavBarTestState createState() => _NavBarTestState();
}

class _NavBarTestState extends State<NavBarTest> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ShopScreen(),
    const OrderScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: MyColorTheme.primaryColor,      buttonBackgroundColor: MyColorTheme.primaryColor,
        height: 50,
        items: const <Widget>[
          Icon(Icons.home, size: 24, color: Colors.white),
          Icon(Icons.shop, size: 24, color: Colors.white),
          Icon(Icons.shopping_cart, size: 24, color: Colors.white),
          Icon(Icons.settings, size: 24, color: Colors.white),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

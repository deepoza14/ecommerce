import 'package:flutter/material.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/drawer.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const NavDrawer(),

      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon:  Icon(
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
                MaterialPageRoute(builder: (context) =>  const Cart()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: MyColorTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}

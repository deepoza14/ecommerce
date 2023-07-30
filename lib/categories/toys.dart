import 'package:flutter/material.dart';
class ToysScreen extends StatefulWidget {
  const ToysScreen({super.key});

  @override
  State<ToysScreen> createState() => _ToysScreenState();
}

class _ToysScreenState extends State<ToysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.dashboard_sharp,
            color: Colors.green,
          ),
        ),
        title: SizedBox(
          width: 120,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

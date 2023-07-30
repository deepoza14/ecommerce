import 'package:flutter/material.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class ClothingScreen extends StatefulWidget {
  const ClothingScreen({super.key});

  @override
  State<ClothingScreen> createState() => _ClothingScreenState();
}

class _ClothingScreenState extends State<ClothingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Clothing",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoU09nmqmzhIZoGUQcj504H37JPb2XZppVPg&usqp=CAU")),
              title: const Text("Boys"),
              //  subtitle: Text("Desc"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://www.designerchildrenswear.com/media/catalog/category/New_In_SS23_Girls_mobile_1.jpg?auto=webp&format=pjpg&fit=cover")),
              title: const Text("Girls"),
              //  subtitle: Text("Desc"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://www.designerchildrenswear.com/media/catalog/category/New_In_SS23_Girls_mobile_1.jpg?auto=webp&format=pjpg&fit=cover")),
              title: const Text("Girls"),
              //  subtitle: Text("Desc"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://www.designerchildrenswear.com/media/catalog/category/New_In_SS23_Girls_mobile_1.jpg?auto=webp&format=pjpg&fit=cover")),
              title: const Text("Girls"),
              //  subtitle: Text("Desc"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              leading: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                      "https://www.designerchildrenswear.com/media/catalog/category/New_In_SS23_Girls_mobile_1.jpg?auto=webp&format=pjpg&fit=cover")),
              title: const Text("Girls"),
              //  subtitle: Text("Desc"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

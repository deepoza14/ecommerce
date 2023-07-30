import 'package:flutter/material.dart';
import 'package:masysecommerce/models/productlist.dart';
import 'package:masysecommerce/models/wishlist_database.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/productdetail.dart';
import 'package:masysecommerce/screens/search_screen.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  List<bool> isFavoriteList = List<bool>.filled(productlist.length, false);

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
      if (isFavoriteList[index]) {
        WishlistDatabase.addToWishlist(
          title: productlist[index].name,
          image: productlist[index].imageUrl[0],
          price: productlist[index].price,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to wishlist'),
          ),
        );
      } else {
        WishlistDatabase.removeFromWishlist(productlist[index].name);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Removed from wishlist'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: MyColorTheme.whiteColor,
          ),
        ),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8.0),
                    Text(
                      'Search...',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
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
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: productlist.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = productlist[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(product: product),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                product.imageUrl[0],
                                fit: BoxFit.contain,
                                height: 135,
                                width: 135,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 235,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      product.name,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: 235,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      "₹${product.price}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    width: 235,
                                    padding: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                        'Eligible for FREE Shipping'),
                                  ),
                                  Container(
                                    width: 235,
                                    padding:
                                        const EdgeInsets.only(left: 10, top: 5),
                                    child: const Text(
                                      'In Stock',
                                      style: TextStyle(
                                        color: Colors.teal,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () => toggleFavorite(index),
                                  icon: Icon(
                                    isFavoriteList[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: MyColorTheme.primaryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

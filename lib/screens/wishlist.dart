import 'package:flutter/material.dart';
import 'package:masysecommerce/models/cart_database.dart';
import 'package:masysecommerce/models/wishlist_database.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/theme/color_theme.dart';
import 'package:share_plus/share_plus.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late Future<List<Map<String, dynamic>>> _wishlistItemsFuture;

  @override
  void initState() {
    super.initState();
    _refreshWishlistItems();
  }

  Future<void> _refreshWishlistItems() async {
    setState(() {
      _wishlistItemsFuture = WishlistDatabase.getWishlistItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: MyColorTheme.primaryColor,
          ),
        ),
        title: const Text('My Wishlist'),
        actions: [
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _wishlistItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          List<Map<String, dynamic>> wishListItems = snapshot.data ?? [];

          if (wishListItems.isEmpty) {
            return  Center(
              child: Image.asset("assets/images/empty.png"),
            );
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Set the count to 2
              childAspectRatio: 0.7, // Adjust the aspect ratio as needed
            ),
            itemCount: wishListItems.length,
            itemBuilder: (context, index) {
              final item = wishListItems[index];

              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: Image.network(item['image']),
                          ),
                          Text(
                            item['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Price: ${item['price']}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    CartDatabase.addToCart(
                                      title: item['title'],
                                      image: item['image'],
                                      price: item['price'],
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Item added to cart')),
                                    );
                                  },
                                  child: const Text(
                                    "Add to Cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            _showBottomSheet(item['title'].toString());
                          },
                          child: const Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showBottomSheet(String title) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Share.share('check out my website https://example.com',
                      subject: 'Look what I made!');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete'),
                onTap: () async {
                  await WishlistDatabase.removeFromWishlist(title);
                  Navigator.pop(context);
                  _refreshWishlistItems(); // Refresh the wishlist items
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

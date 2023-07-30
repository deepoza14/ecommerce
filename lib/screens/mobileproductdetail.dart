import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masysecommerce/models/cart_database.dart';
import 'package:masysecommerce/models/mobileproducts.dart';
import 'package:masysecommerce/models/wishlist_database.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class MobileProductDetails extends StatefulWidget {
  final MobileProduct product;

  const MobileProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _MobileProductDetailsState createState() => _MobileProductDetailsState();
}

class _MobileProductDetailsState extends State<MobileProductDetails> {
  int itemCount = 1;
  bool isFavorite = false; // Track the favorite status
  bool isAddedToCart = false;

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  void addToCart() {
    CartDatabase.addToCart(
      title: widget.product.name,
      image: widget.product.imageUrl,
      price: widget.product.price,
      quantity: itemCount,
    );
    // Optionally, you can show a snackbar or display a message to indicate that the item was added to the cart.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Added to cart'),
      ),
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      if (isFavorite) {
        WishlistDatabase.addToWishlist(
          title: widget.product.name,
          image: widget.product.imageUrl,
          price: widget.product.price,
        );
        // Optionally, you can show a snackbar or display a message to indicate that the item was added to the wishlist.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Added to wishlist'),
          ),
        );
      } else {
        WishlistDatabase.removeFromWishlist(widget.product.name);
        // Optionally, you can show a snackbar or display a message to indicate that the item was removed from the wishlist.
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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: MyColorTheme.primaryColor),
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
                  MaterialPageRoute(
                      builder: (context) => const WishListScreen()),
                );
              },
              icon: const Icon(Icons.favorite),
              color: MyColorTheme.primaryColor),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Cart()),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart),
                  color: MyColorTheme.primaryColor),
              itemCount > 0
                  ? Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          itemCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Center(
                  child: SizedBox(
                    height: 200,
                    child: Image.network(widget.product.imageUrl),
                  ),
                ),
              ),
              Container(
                height: 100,
                color: CupertinoColors.extraLightBackgroundGray,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.video_camera_back_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                          const Text("video"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.support_agent,
                                size: 40,
                              ),
                            ),
                          ),
                          const Text("Chat With Us"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.share,
                                size: 40,
                              ),
                            ),
                          ),
                          const Text("Share"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.view_carousel_rounded,
                                size: 40,
                              ),
                            ),
                          ),
                          const Text("360 View"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  widget.product.name,
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "₹${widget.product.price}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "(Incl. of all taxes)",
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "₹${widget.product.price}",
                    style: const TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 2.0,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 170),
                    child: IconButton(
                      onPressed: toggleFavorite,
                      // Call toggleFavorite when the favorite icon is clicked
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: MyColorTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "XL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black)),
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Blue",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "In Stock",
                  style: TextStyle(
                      color: MyColorTheme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  widget.product.description,
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
            width: width * 0.5,
            child: TextButton(
              onPressed: () {
                if (isAddedToCart) {
                  // Navigate to cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cart()),
                  );
                } else {
                  // Add to cart
                  addToCart();
                  setState(() {
                    isAddedToCart = true;
                  });
                }
              },
              child: Text(
                isAddedToCart ? "Go to cart" : "Add to cart",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            width: width * 0.5,
            child: TextButton(
              onPressed: () {
                // Handle "Buy now" logic
              },
              child: const Text(
                "Buy now",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

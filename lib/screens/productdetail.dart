import 'package:flutter/material.dart';
import 'package:masysecommerce/models/cart_database.dart';
import 'package:masysecommerce/models/productlist.dart';
import 'package:masysecommerce/models/wishlist_database.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/search_screen.dart';
import 'package:masysecommerce/theme/color_theme.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetails extends StatefulWidget {
  final ProductList product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int itemCount = 1;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _buildDots() {
    return List<Widget>.generate(
      widget.product.imageUrl.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              _currentPage == index ? MyColorTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  bool isFavorite = false; // Track the favorite status

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
      image: widget.product.imageUrl[0],
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
          image: widget.product.imageUrl[0],
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: MyColorTheme.whiteColor),
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
          /* IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WishListScreen()),
                );
              },
              icon: const Icon(Icons.favorite),
              color: MyColorTheme.primaryColor),*/
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
                  color: MyColorTheme.whiteColor),
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
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.product.imageUrl.length,
                      itemBuilder: (BuildContext context, int index) {
                        final imageUrl = widget.product.imageUrl[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(imageUrl),
                        );
                      },
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: toggleFavorite,
                          // Call toggleFavorite when the favorite icon is clicked
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: MyColorTheme.primaryColor,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            Share.share(
                                'check out my website https://example.com',
                                subject: 'Look what I made!');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildDots(),
              ),
              const Divider(),
              SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  "https://thenounproject.com/api/private/icons/2304185/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text(
                                "Free Delivery",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  "https://thenounproject.com/api/private/icons/68628/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text(
                                "7 days Replacement",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  "https://thenounproject.com/api/private/icons/4780476/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text(
                                "1 Year Warranty",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  "https://thenounproject.com/api/private/icons/5565714/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text(
                                "Top Brand",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                  "https://thenounproject.com/api/private/icons/2795499/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Text(
                                "Secure transaction",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  widget.product.name,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 200, bottom: 10, right: 10),
        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
            color: MyColorTheme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: decrementItem,
                  ),
                  Text(
                    itemCount.toString(),
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: incrementItem,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed:
                        addToCart, // Call addToCart when the button is pressed
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masysecommerce/database/address_database.dart';
import 'package:masysecommerce/models/cart_database.dart';
import 'package:masysecommerce/models/wishlist_database.dart';
import 'package:masysecommerce/screens/orderreview.dart';
import 'package:masysecommerce/screens/savedaddress.dart';
import 'package:masysecommerce/screens/search_screen.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Future<List<Map<String, dynamic>>> _cartItemsFuture =
      CartDatabase.getCartItems();
  double subtotal = 0; // Variable to hold the subtotal

  @override
  void initState() {
    super.initState();
    calculateSubtotal();
    fetchAddresses();
  }

  List<Map<String, dynamic>> addresses = [];

  void fetchAddresses() async {
    final List<Map<String, dynamic>> fetchedAddresses =
        await AddressDatabase.getAddresses();
    setState(() {
      addresses = fetchedAddresses;
    });
  }

  void calculateSubtotal() async {
    List<Map<String, dynamic>> cartItems = await _cartItemsFuture;

    double tempSubtotal = 0;
    for (var item in cartItems) {
      int quantity = item['quantity'] ?? 1;
      double price = item['price'] is String
          ? double.tryParse(item['price'].replaceAll(',', '')) ?? 0
          : (item['price'] ?? 0).toDouble();
      tempSubtotal += price * quantity;
    }

    setState(() {
      subtotal = tempSubtotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishListScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green[50],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: _showBottomSheet,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Dombivli 421201",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _cartItemsFuture,
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
                List<Map<String, dynamic>> cartItems = snapshot.data ?? [];

                if (cartItems.isEmpty) {
                  return Center(
                    child: Image.asset("assets/images/empty.png"),
                  );
                }

                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    int quantity = item['quantity'] ?? 1;

                    void updateCartItemQuantity(
                        String title, int quantity) async {
                      await CartDatabase.updateCartItemQuantity(
                          title, quantity);
                      setState(() {
                        _cartItemsFuture = CartDatabase.getCartItems();
                      });
                    }

                    void incrementQuantity() {
                      setState(() {
                        quantity++;
                        updateCartItemQuantity(item['title'], quantity);

                        // Recalculate the subtotal when quantity is incremented
                        double price = item['price'] is String
                            ? double.tryParse(
                                    item['price'].replaceAll(',', '')) ??
                                0
                            : (item['price'] ?? 0).toDouble();
                        subtotal += price;
                      });
                    }

                    void decrementQuantity() {
                      setState(() {
                        if (quantity > 1) {
                          quantity--;
                          updateCartItemQuantity(item['title'], quantity);
                          // Recalculate the subtotal when quantity is decremented
                          double price = item['price'] is String
                              ? double.tryParse(
                                      item['price'].replaceAll(',', '')) ??
                                  0
                              : (item['price'] ?? 0).toDouble();
                          subtotal -= price;
                        }
                      });
                    }

                    void _removeItemFromCart() {
                      double price = item['price'] is String
                          ? double.tryParse(
                                  item['price'].replaceAll(',', '')) ??
                              0
                          : (item['price'] ?? 0).toDouble();
                      int quantity = item['quantity'] ?? 1;

                      CartDatabase.removeFromCart(item['title']);
                      setState(() {
                        _cartItemsFuture = CartDatabase.getCartItems();
                        // Recalculate the subtotal when an item is removed
                        subtotal -= price * quantity;
                      });
                    }

                    return Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 200,
                              width: 100,
                              child: Image.network(item['image']),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      'Price: ${item['price']}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    quantity == 1 ? Icons.delete : Icons.remove,
                                  ),
                                  onPressed: quantity == 1
                                      ? _removeItemFromCart
                                      : decrementQuantity,
                                  color: Colors.black,
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(fontSize: 18),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: incrementQuantity,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            Card(
                              child: TextButton(
                                onPressed: _removeItemFromCart,
                                child: const Text("Delete"),
                              ),
                            ),
                            Card(
                              child: TextButton(
                                onPressed: () {
                                  WishlistDatabase.addToWishlist(
                                    title: item['title'],
                                    image: item['image'],
                                    price: item['price'],
                                  );
                                  // Optionally, you can show a snackbar or display a message to indicate that the item was added to the wishlist.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added to wishlist'),
                                    ),
                                  );
                                },
                                child: const Text("Add to Wishlist"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ₹${subtotal.toStringAsFixed(2)}"),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderReviewScreen()));
                    },
                    child: const Text("Proceed"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Select Delivery Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: MyColorTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 4),
                child: Text(
                  "Select a delivery location to see product \navailability, offers and discounts",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: addresses.length + 1,
                    itemBuilder: (context, index) {
                      if (index == addresses.length) {
                        return buildAddNewAddressWidget();
                      } else {
                        final address = addresses[index];
                        return buildAddressWidget(address);
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _showPincodeBottomSheet(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: MyColorTheme.primaryColor),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Enter a pincode",
                        style: TextStyle(
                            color: MyColorTheme.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Icon(
                      (Icons.my_location),
                      color: MyColorTheme.primaryColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Detect my location",
                      style: TextStyle(
                          color: MyColorTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildAddressWidget(Map<String, dynamic> address) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.green[100],
        border: Border.all(color: Colors.green),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              address[AddressDatabase.columnFullName],
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
            child: Text(
              "${address[AddressDatabase.columnFlatBuilding]}, ${address[AddressDatabase.columnLandmark]}, ${address[AddressDatabase.columnCity]}, ${address[AddressDatabase.columnState]},${address[AddressDatabase.columnPincode]}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Center(
                child: Text(
                  address[AddressDatabase.columnAddressType],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddNewAddressWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SavedAddress()),
          );
        },
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(color: Colors.green),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline,
                size: 30,
                color: MyColorTheme.primaryColor,
              ),
              Text(
                "Add New Address",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColorTheme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPincodeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: GestureDetector(
              onTap: () {
                // Dismiss the keyboard when tapping outside the input fields
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            "Enter PIN Code",
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: MyColorTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 4),
                      child: Text(
                        "Enter PIN Code to see product \navailability, offers and discounts",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "PIN Code",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: Colors.green,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                ),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(6),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MyColorTheme.primaryColor,
                              // Button background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                // Button border radius
                              ),
                            ),
                            onPressed: () {
                              // Handle button press here
                            },
                            child: const Text(
                              "Apply",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

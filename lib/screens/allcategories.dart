import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masysecommerce/database/address_database.dart';
import 'package:masysecommerce/models/category_list.dart';
import 'package:masysecommerce/screens/drawer.dart';
import 'package:masysecommerce/screens/savedaddress.dart';
import 'package:masysecommerce/theme/color_theme.dart';

import 'wishlist.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  List<Map<String, dynamic>> addresses = [];

  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  void fetchAddresses() async {
    final List<Map<String, dynamic>> fetchedAddresses =
        await AddressDatabase.getAddresses();
    setState(() {
      addresses = fetchedAddresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.dashboard_sharp,
                color: MyColorTheme.whiteColor,
              ),
            );
          },
        ),
        title: Text(
          "All Categories",
          style: TextStyle(color: MyColorTheme.whiteColor),
        ),
        actions: [
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
            color: MyColorTheme.whiteColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: MyColorTheme.whiteColor,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return CategoryTile(
                    category: category,
                  );
                },
              ),
            ),
          ],
        ),
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

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(category.imageUrl),
      title: Text(
        category.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      children: category.subcategories
          .map(
            (subcategory) => ListTile(
              title: Text(subcategory.name),
              onTap: () {
                // Handle subcategory tap
              },
            ),
          )
          .toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/homepage.dart';
import 'package:masysecommerce/screens/myorders.dart';
import 'package:masysecommerce/theme/color_theme.dart';

import 'drawer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedOrderType;
  String? selectOrderDate;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back_ios, color: MyColorTheme.whiteColor),
        ),
        title: Text(
          "My Orders",
          style: TextStyle(
              color: MyColorTheme.whiteColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showFilterBottomSheet();
            },
            icon: const Icon(Icons.filter_list),
            color: MyColorTheme.whiteColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Cart(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
            color: MyColorTheme.whiteColor,
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Orders',
            ),
            Tab(
              text: 'Refunds',
            ),
          ],
          labelColor: MyColorTheme.whiteColor,
          unselectedLabelColor: MyColorTheme.whiteColor,
          indicator: BoxDecoration(
            color: MyColorTheme.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            // Orders Tab
            MyOrdersScreen(),
            // Pending Tab
            Center(
              child: Text('Pending'),
            ),
          ],
        ),
      ),
    );
  }

  void showFilterBottomSheet() {
    double width = MediaQuery.of(context).size.width;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "FILTER BY ORDER TYPE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
                    const SizedBox(height: 16),
                    RadioListTile(
                      title: const Text('Orders'),
                      value: 'Orders',
                      groupValue: selectedOrderType,
                      onChanged: (value) {
                        setState(() {
                          selectedOrderType = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Not Yet Shipped'),
                      value: 'Not Yet Shipped',
                      groupValue: selectedOrderType,
                      onChanged: (value) {
                        setState(() {
                          selectedOrderType = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Cancelled'),
                      value: 'Cancelled',
                      groupValue: selectedOrderType,
                      onChanged: (value) {
                        setState(() {
                          selectedOrderType = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    const Text(
                      "FILTER BY ORDER DATE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    RadioListTile(
                      title: const Text('Last 30 Days'),
                      value: 'Last 30 Days',
                      groupValue: selectOrderDate,
                      onChanged: (value) {
                        setState(() {
                          selectOrderDate = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('Last 3 Months'),
                      value: 'Last 3 Months',
                      groupValue: selectOrderDate,
                      onChanged: (value) {
                        setState(() {
                          selectOrderDate = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('2023'),
                      value: '2023',
                      groupValue: selectOrderDate,
                      onChanged: (value) {
                        setState(() {
                          selectOrderDate = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('2022'),
                      value: '2022',
                      groupValue: selectOrderDate,
                      onChanged: (value) {
                        setState(() {
                          selectOrderDate = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('2021'),
                      value: '2021',
                      groupValue: selectOrderDate,
                      onChanged: (value) {
                        setState(() {
                          selectOrderDate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.4,
                          child: TextButton(
                            onPressed: () {
                              // Handle "Clear All" logic
                            },
                            child: const Text(
                              "Clear All",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.4,
                          child: Container(
                            color: Colors.green,
                            child: TextButton(
                              onPressed: () {
                                // Handle "Apply" logic
                              },
                              child: const Text(
                                "Apply",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

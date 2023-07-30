import 'package:flutter/material.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColorTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColorTheme.whiteColor,
          ),
        ),
        title: Text(
          "Order Details",
          style: TextStyle(
            color: MyColorTheme.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    "Order Status",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    "Delivered on Jun 20",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    "Delivery Timeline",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildDeliveryTimelineItem(
                      title: "Order Placed",
                      subTitle: "June 10, 2023",
                      isCompleted: true,
                    ),
                    _buildDeliveryTimelineItem(
                      title: "Processing",
                      subTitle: "June 11, 2023",
                      isCompleted: true,
                    ),
                    _buildDeliveryTimelineItem(
                      title: "Shipped",
                      subTitle: "June 12, 2023",
                      isCompleted: true,
                    ),
                    _buildDeliveryTimelineItem(
                      title: "Out for Delivery",
                      subTitle: "June 20, 2023",
                      isCompleted: true,
                    ),
                    _buildDeliveryTimelineItem(
                      title: "Delivered",
                      subTitle: "June 20, 2023",
                      isCompleted: true,
                    ),
                  ],
                ),
                const ExpansionTile(
                  title: Text(
                    "Order Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Name',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Masys Tech',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Order Number',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "1234567890",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Shipment Number',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "#1234567890",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Order Date',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "10 June 2023",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Product Total',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "₹1000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Delivery Fee',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Free",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "₹40.00",
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.grey,
                                    decorationThickness: 2.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Order Amount',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "₹1000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Invoice Number',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "UA15162MAS123",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.file_download_outlined,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Invoice Amount',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "₹1000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Payment Mode',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "PREPAID",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, top: 0),
                  child: Text(
                    "Order Items",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: const Text(
                    "Samsung Galaxy s23",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Image.network(
                    "https://m.media-amazon.com/images/I/91uYwEX1wKL._SY741_.jpg",
                    fit: BoxFit.contain,
                    height: 135,
                  ),
                  subtitle: const Text(
                    "₹1000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Text(
                    "Qty: 1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text(
                    "Google Pixel 6",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Image.network(
                    "https://img1.gadgetsnow.com/gd/images/products/additional/large/G381894_View_1/mobiles/smartphones/google-pixel-6a-5g-128-gb-charcoal-6-gb-ram-.jpg",
                    fit: BoxFit.contain,
                    height: 135,
                  ),
                  subtitle: const Text(
                    "₹1000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Text(
                    "Qty: 1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Delivery Address",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('''MASYS TECH SOLUTION PVT. LTD.
Block No: 7/9/10,First Floor, Omkar Building, Beside Potoba Restaurant, MIDC, Dombivli East'''),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          SizedBox(
            width: width * 0.5,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Need Help",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            color: MyColorTheme.primaryColor,
            width: width * 0.5,
            child: TextButton(
              onPressed: () {
                // Handle "Buy now" logic
              },
              child: const Text(
                "Reorder",
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

  Widget _buildDeliveryTimelineItem({
    required String title,
    required String subTitle,
    bool isCompleted = false,
  }) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? MyColorTheme.primaryColor : Colors.grey,
        ),
        child: Icon(
          isCompleted ? Icons.check : Icons.circle,
          color: Colors.white,
          size: 16,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

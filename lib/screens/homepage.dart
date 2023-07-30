import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masysecommerce/categories/clothing/clothing.dart';
import 'package:masysecommerce/categories/toys.dart';
import 'package:masysecommerce/models/bannerlist.dart';
import 'package:masysecommerce/models/coupon_banner.dart';
import 'package:masysecommerce/models/mobileproducts.dart';
import 'package:masysecommerce/models/productlist.dart';
import 'package:masysecommerce/models/products.dart';
import 'package:masysecommerce/screens/allcategories.dart';
import 'package:masysecommerce/screens/cart.dart';
import 'package:masysecommerce/screens/drawer.dart';
import 'package:masysecommerce/screens/mobileproductdetail.dart';
import 'package:masysecommerce/screens/productdetail.dart';
import 'package:masysecommerce/screens/savedaddress.dart';
import 'package:masysecommerce/screens/search_screen.dart';
import 'package:masysecommerce/screens/viewall.dart';
import 'package:masysecommerce/screens/wishlist.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final PageController _page1Controller = PageController();
  final PageController _page2Controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startAutoPlay() {
    const duration = Duration(seconds: 3);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (_currentPage < imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _page1Controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _page2Controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.dashboard_sharp,
                color: Colors.white,
              ),
            );
          },
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
          /*IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search,color: Colors.green,)),*/
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WishListScreen()),
                );
              },
              icon: const Icon(Icons.favorite),
              color: Colors.white),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              color: Colors.white),
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
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/mobile.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Mobiles",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ClothingScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/fashion.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Fashion  ",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/electronics.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Electronics",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/electronic.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Electronics",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/home.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/deal.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Deals",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/deals.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Deals",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/essentials.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Essentials",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/appliance1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Appliance",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/appliance.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Appliances",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/beauty.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Beauty",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/toys.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Toys",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/beauty.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Beauty",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ToysScreen()));
                    },
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/categories/jwellery.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Jewellery",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllCategories()));
                    },
                    child: const SizedBox(
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          Icon(
                            Icons.more_horiz,
                            size: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "More",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: couponList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 180.0,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  couponList[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildDots(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "New Arrivals",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));
                            },
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));

                                  },
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: MyColorTheme.primaryColor),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded,
                                    color: MyColorTheme.primaryColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = productlist[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the details screen and pass the product data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(product: product),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 150,
                                      child: Image.network(
                                        product.imageUrl[0],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      product.name,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "₹${product.price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Trending",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));

                                  },                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: MyColorTheme.primaryColor),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded,
                                    color: MyColorTheme.primaryColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productlist.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = productlist[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the details screen and pass the product data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetails(product: product),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                height: 50,
                                width: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 50,
                                      child: Image.network(
                                        product.imageUrl[0],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              "₹${product.price}",
                                              style: const TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "New Mobile Arrivals",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));

                                  },                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: MyColorTheme.primaryColor),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded,
                                    color: MyColorTheme.primaryColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mobileProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final productMobile = mobileProducts[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the details screen and pass the product data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MobileProductDetails(
                                      product: productMobile),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                height: 250,
                                width: 250,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child:
                                          Image.network(productMobile.imageUrl),
                                    ),
                                    Text(
                                      productMobile.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      productMobile.price,
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      productMobile.description,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        decorationColor: Colors.red,
                                        decorationThickness: 2.0,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Most Viewed Stores",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 80,
                                  child: Image.network(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDOqtDolRpLaYqr0ERLmgdhmSCziC3qGd9BA&usqp=CAU"),
                                ),
                                const Text("Casual Shoes"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 80,
                                  child: Image.network(
                                      "https://m.media-amazon.com/images/I/51XGrwhczrL._SX300_SY300_QL70_FMwebp_.jpg"),
                                ),
                                const Text("Smart Watches"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 80,
                                  child: Image.network(
                                      "https://cdn.shopify.com/s/files/1/1676/7297/products/Mainimage_2e9251b5-3ea8-48a1-b71a-830c1686c793_250x.jpg?v=1676551161"),
                                ),
                                const Text("True Wireless"),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 80,
                                  child: Image.network(
                                      "https://img1.gadgetsnow.com/gd/images/products/additional/large/G324924_View_1/computer-laptop/laptops/lenovo-ideapad-3-81wb01b0in-10th-gen-intel-core-i3-10110u-15-6-inches-notebook-laptop-8gb-512gb-ssd-windows-11-platinum-grey-1-7-kg-.jpg"),
                                ),
                                const Text("Laptop"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Toys",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));

                                  },                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: MyColorTheme.primaryColor),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded,
                                    color: MyColorTheme.primaryColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the details screen and pass the product data
                                /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(product: product),
                                  ),
                                );*/
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(product.image),
                                      ),
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        product.price.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        product.discountedPrice.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          decorationThickness: 2.0,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _page1Controller,
                        itemCount: imageList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 180.0,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  imageList[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildDots(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Beauty",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ViewAllScreen()));

                                  },                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        color: MyColorTheme.primaryColor),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded,
                                    color: MyColorTheme.primaryColor),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index];
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the details screen and pass the product data
                                /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(product: product),
                                  ),
                                );*/
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  width: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(product.image),
                                      ),
                                      Text(
                                        product.title,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        product.price.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        product.discountedPrice.toString(),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationColor: Colors.red,
                                          decorationThickness: 2.0,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                    SizedBox(
                      height: 180,
                      child: PageView.builder(
                        controller: _page2Controller,
                        itemCount: couponList.length,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 180.0,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  couponList[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildDots(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    return List<Widget>.generate(
      imageList.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
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

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                            fontWeight: FontWeight.w900, color: Colors.black),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: MyColorTheme.primaryColor,
                        )),
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
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              border: Border.all(color: Colors.green),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    "MASYS TECH",
                                    maxLines: 1,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 10),
                                  child: Text(
                                    "Block No: 7/9/10,First Floor, Omkar Building, Beside Potoba Restaurant, MIDC, Dombivli East",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 20,
                                    width: 50,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Home",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SavedAddress()));
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                border: Border.all(color: Colors.green),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_circle_outline,
                                      size: 30, color: MyColorTheme.primaryColor),
                                  Text(
                                    "Add New Address",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MyColorTheme.primaryColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
                          style: TextStyle(color: MyColorTheme.primaryColor),
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
                        style: TextStyle(color: MyColorTheme.primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
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
                            width: 240,
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

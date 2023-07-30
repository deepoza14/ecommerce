// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masysecommerce/screens/homepage.dart';
import 'package:masysecommerce/models/ourservice.dart';
import 'package:masysecommerce/screens/navbar.dart';
import 'package:masysecommerce/theme/color_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    // Check if the onboarding screen has been shown before
    bool hasShownOnboarding = _prefs.getBool('hasShownOnboarding') ?? false;
    if (hasShownOnboarding) {
      _navigateToMainScreen();
    }
  }

  void _navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: data.length,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 300,
                              child: Lottie.asset(data[index]['imageUrl']!),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              (data[index]['title']!),
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                (data[index]['description']!),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  data.length,
                  (index) => buildDot(index, context),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      onPressed: () {
                        _prefs.setBool('hasShownOnboarding', true);
                        _navigateToMainScreen();
                      },
                    ),
                    ElevatedButton(
                      child: Text(_currentPage == data.length - 1
                          ? 'Get Started'
                          : 'Next'),
                      onPressed: () {
                        if (_currentPage == data.length - 1) {
                          _prefs.setBool('hasShownOnboarding', true);
                          _navigateToMainScreen();
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? MyColorTheme.primaryColor : Colors.grey,
      ),
    );
  }
}

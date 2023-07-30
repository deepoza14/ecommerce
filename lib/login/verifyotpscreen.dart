import 'dart:async';

import 'package:flutter_sms_autofill/flutter_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:masysecommerce/screens/homepage.dart';
import 'package:masysecommerce/theme/color_theme.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOTP extends StatefulWidget {
  final String verifyNum;

  const VerifyOTP({Key? key, required this.verifyNum}) : super(key: key);

  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final TextEditingController _otpController = TextEditingController();
  String? bookingId;
  String? userId;

  Timer? _resendTimer;
  bool _showCounter = true;
  int _counter = 30;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    listenForOTP();
  }

  void codeUpdated() {
    setState(() {});
  }

  void listenForOTP() async {
    String signature = await SmsAutoFill().getAppSignature;
    SmsAutoFill().listenForCode;
    SmsAutoFill().code.listen((code) {
      setState(() {
        _otpController.text = code;
      });
    });
  }

  Future<String> maskPhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString('Mobilenumber')!;
    if (phoneNumber.length >= 6) {
      String maskedNumber = phoneNumber.replaceRange(0, 6, 'X' * 6);
      return maskedNumber;
    }
    return phoneNumber;
  }

  void verifyBooking() {
    if (_otpController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else {
      // Handle incorrect OTP
    }
  }

  void startTimer() {
    setState(() {
      _counter = 30;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          timer.cancel();
          _showCounter = false; // Hide the counter

          // Start the timer again after reaching 30 seconds
          _resendTimer?.cancel();
          startTimer();

          // Show the "Resend OTP" button
        }
      });
    });
  }

  Future<void> resendOTP() async {
    try {
      setState(() {
        _showCounter = true; // Show the counter
        _counter = 30; // Reset the counter
      });

      // Place your code here for sending the OTP via your preferred method

      setState(() {
        // Update the necessary state variables
      });
    } catch (e) {
      // Handle resend OTP failure
    }
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    SmsAutoFill().unregisterListener();
    // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: MyColorTheme.primaryColor),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15)),
                child: Lottie.asset(
                  'assets/lottie/enterotp.json',
                  height: 260,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "OTP Verification",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter the OTP sent to +91 - ${widget.verifyNum}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColorTheme.primaryColor),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Pinput(
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          controller: _otpController,
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) {
                            verifyBooking();
                          },
                          onChanged: (value) {
                            listenForOTP();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            verifyBooking();
                          },
                          color: MyColorTheme.primaryColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 90, vertical: 18),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            "VERIFY & PROCEED",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (_showCounter)
                          Text(
                            'Resend otp in $_counter seconds',
                            // Display the counter
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        if (!_showCounter)
                          TextButton(
                            onPressed: () {
                              resendOTP();
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(
                                fontSize: 15,
                                color: MyColorTheme.primaryColor,
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

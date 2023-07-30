import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  const PrivacyPolicyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Privacy Policy'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This Privacy Policy governs the manner in which [MASYS TECH SOLUTION PVT. LTD.] collects, uses, maintains, and discloses information collected from users (each, a "User") of the [Masys eCommerce] mobile application ("App"). This privacy policy applies to the App and all products and services offered by [MASYS TECH SOLUTION PVT. LTD.].',
            ),
            SizedBox(height: 20),
            Text(
              '1. Personal Identification Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may collect personal identification information from Users in a variety of ways, including but not limited to when Users download and install the App, register an account, place an order, provide feedback, and in connection with other activities, services, features, or resources we make available on our App. Users may be asked for, as appropriate, name, email address, mailing address, phone number, and payment information. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personal identification information, except that it may prevent them from engaging in certain App-related activities.',
            ),
            SizedBox(height: 20),
            Text(
              '2. Non-personal Identification Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may collect non-personal identification information about Users whenever they interact with our App. Non-personal identification information may include the device name, device model, operating system version, unique device identifiers, and other similar technical information.',
            ),
            SizedBox(height: 20),
            Text(
              '3. How We Use Collected Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '[MASYS TECH SOLUTION PVT. LTD.] may collect and use Users\' personal information for the following purposes:',
            ),
            SizedBox(height: 10),
            Text(
              '- To provide and improve our services: We may use the information Users provide to deliver the requested products or services, personalize the user experience, and improve the overall functionality and performance of the App.',
            ),
            Text(
              '- To process transactions: We may use the information Users provide about themselves when placing an order only to provide service to that order. We do not share this information with outside parties except to the extent necessary to provide the service.',
            ),
            Text(
              '- To send push notifications and marketing communications: With the user\'s consent, we may send periodic push notifications and marketing communications to the User\'s device. Users may opt-out of receiving these communications at any time.',
            ),
            SizedBox(height: 20),
            Text(
              '4. How We Protect Your Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We adopt appropriate data collection, storage, and processing practices and security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information, username, password, transaction information, and data stored on our App.',
            ),
            SizedBox(height: 20),
            Text(
              '5. Sharing Your Personal Information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We do not sell, trade, or rent Users\' personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates, and advertisers for the purposes outlined above.',
            ),
            SizedBox(height: 20),
            Text(
              '6. Third Party Services:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The App may use third-party services that may collect information used to identify you. These third-party service providers have their own privacy policies addressing how they use such information.',
            ),
            SizedBox(height: 20),
            Text(
              '7. Changes to This Privacy Policy:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may update this privacy policy at any time. Users are encouraged to frequently check this page for any changes. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

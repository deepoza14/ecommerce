import 'package:flutter/material.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: MyColorTheme.primaryColor,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: MyColorTheme.primaryColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Image.network(
                            "https://cdn1.iconfinder.com/data/icons/user-pictures/100/female1-512.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "User Information",
                        style: TextStyle(
                            color: MyColorTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: TextStyle(
                                    color: MyColorTheme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText:
                                      'Masys', // Sets the label text for the field
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: TextStyle(
                                    color: MyColorTheme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText:
                                      'Solutions', // Sets the label text for the field
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                          color: MyColorTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText:
                            'masys@gmail.com', // Sets the label text for the field
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  color: MyColorTheme.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText:
                                    'Male', // Sets the label text for the field
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mobile",
                                style: TextStyle(
                                    color: MyColorTheme.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText:
                                      '9699090469', // Sets the label text for the field
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          color: MyColorTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: MyColorTheme.primaryColor,
                        ),
                        hintText:
                            '*************', // Sets the label text for the field
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Update",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColorTheme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

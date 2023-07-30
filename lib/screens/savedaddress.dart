import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masysecommerce/database/address_database.dart';
import 'package:masysecommerce/screens/addnewaddress.dart';
import 'package:masysecommerce/screens/update_address.dart';
import 'package:masysecommerce/theme/color_theme.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
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

  void editAddress(int index) {
    final address = addresses[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateAddress(address: address),
      ),
    );
  }

  void deleteAddress(int index) async {
    final address = addresses[index];
    final int addressId = address[AddressDatabase.columnId];

    await AddressDatabase.deleteAddress(addressId);

    fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: MyColorTheme.primaryColor,
          ),
        ),
        title: Text(
          "Saved Address",
          style: TextStyle(color: MyColorTheme.primaryColor),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewAddress(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: MyColorTheme.primaryColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add a new address",
                      style: TextStyle(
                        color: MyColorTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final address = addresses[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 10, right: 15, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      address[AddressDatabase.columnFullName],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          address[AddressDatabase
                                              .columnAddressType],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                PopupMenuButton(
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(
                                          Icons.edit,
                                          color: MyColorTheme.primaryColor,
                                        ),
                                        title: const Text("Edit"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          editAddress(index);
                                        },
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(
                                          CupertinoIcons.delete,
                                          color: MyColorTheme.primaryColor,
                                        ),
                                        title: const Text("Default"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          deleteAddress(index);
                                        },
                                      ),
                                    ),
                                    PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(
                                          CupertinoIcons.delete,
                                          color: MyColorTheme.primaryColor,
                                        ),
                                        title: const Text("Delete"),
                                        onTap: () {
                                          Navigator.pop(context);
                                          deleteAddress(index);
                                        },
                                      ),
                                    ),
                                  ],
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: MyColorTheme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              address[AddressDatabase.columnFlatBuilding],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              address[AddressDatabase.columnLandmark],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "${address[AddressDatabase.columnCity]}, ${address[AddressDatabase.columnState]},${address[AddressDatabase.columnPincode]}",
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              "Phone: ${address[AddressDatabase.columnAlternateMobile]}",
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

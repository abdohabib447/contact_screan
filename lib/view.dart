import 'package:contact/custum_contact_view.dart';
import 'package:contact/custum_text_field.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  static String routeName = 'view';
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<Map<String, dynamic>> contacts = [];

  void addContact() {
    if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
      contacts.add({
        "name": nameController.text,
        "phone": phoneController.text,
        "isVisable": true
      });
      setState(() {});
      nameController.clear();
      phoneController.clear();
    }
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void visibleView(int index) {
    setState(() {
      contacts[index]["isVisable"] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Contacts Screen'),
        backgroundColor: const Color.fromARGB(255, 112, 179, 235),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: nameController,
              hintText: 'Enter Your Name Here',
              icon: Icons.edit,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneController,
              hintText: 'Enter Your Phone Number',
              icon: Icons.phone,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: addContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 112, 179, 235), // Change button color here
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: contacts[index]["isVisable"],
                    child: ContactView(
                      name: contacts[index]['name']!,
                      phone: contacts[index]['phone']!,
                      onDelete: () => visibleView(index),
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

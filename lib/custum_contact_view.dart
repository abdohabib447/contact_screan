import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final String name;
  final String phone;
  final VoidCallback onDelete;

  ContactView({
    required this.name,
    required this.phone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        title: Text('Name: $name'),
        subtitle: Text('Phone: $phone'),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

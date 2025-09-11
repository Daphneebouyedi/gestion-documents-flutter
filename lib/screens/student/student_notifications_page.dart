import 'package:flutter/material.dart';

class StudentNotificationsPage extends StatelessWidget {
  const StudentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications"), backgroundColor: Colors.teal, centerTitle: true),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(title: Text("Paiement reçu"), subtitle: Text("15 avr. 2024")),
          ListTile(title: Text("Nouveau bulletin disponible"), subtitle: Text("12 avr. 2024")),
          ListTile(title: Text("Rappel: réunion parents-enseignants"), subtitle: Text("10 avr. 2024")),
        ],
      ),
    );
  }
}

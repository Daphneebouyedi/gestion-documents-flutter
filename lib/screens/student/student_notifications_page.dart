import 'package:flutter/material.dart';

class StudentNotificationsPage extends StatelessWidget {
  const StudentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);

    // Exemple de notifications (plus tard récupérées depuis l’admin / backend)
    final List<Map<String, String>> notifications = [
      {"title": "Paiement reçu", "date": "15 avr. 2024"},
      {"title": "Nouveau bulletin disponible", "date": "12 avr. 2024"},
      {"title": "Rappel: réunion parents-enseignants", "date": "10 avr. 2024"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: turquoise,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 3,
            child: ListTile(
              leading: Icon(Icons.notifications, color: turquoise, size: 32),
              title: Text(
                notification['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                notification['date']!,
                style: const TextStyle(color: Colors.black54),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black38),
              onTap: () {
                // TODO: action lorsqu'on clique sur une notification
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter_application_1/theme.dart';

class ParentNotificationsPage extends StatelessWidget {
  const ParentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Exemple de notifications (tu pourras remplacer par les vraies données backend)
    final List<Map<String, String>> notifications = [
      {"title": "Paiement reçu", "date": "15 avr. 2024"},
      {"title": "Nouveau bulletin disponible", "date": "12 avr. 2024"},
      {"title": "Rappel: réunion parents-enseignants", "date": "10 avr. 2024"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/parent/home');
          },
        ),
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
              leading: const Icon(Icons.notifications, color: primaryColor, size: 32),
              title: Text(
                notification['title']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                notification['date']!,
                style: const TextStyle(color: blackColor.withOpacity(0.54)),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: blackColor.withOpacity(0.38)),
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

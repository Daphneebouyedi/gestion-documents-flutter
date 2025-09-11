import 'package:flutter/material.dart';

class ParentNotificationsPage extends StatelessWidget {
  const ParentNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA);
    const Color iconColor = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(58),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/parent/home');
            },
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 18),
          NotificationItem(
            icon: Icons.check_circle,
            iconColor: iconColor,
            title: "Demande validée",
            subtitle: "Votre demande a été validée",
            divider: true,
          ),
          NotificationItem(
            icon: Icons.hourglass_bottom,
            iconColor: iconColor,
            title: "Demande en attente",
            subtitle: "Votre demande est en attente",
            divider: true,
          ),
          NotificationItem(
            icon: Icons.error_outline,
            iconColor: iconColor,
            title: "Retard paiement",
            subtitle: "Vous n'êtes pas à jour dans vos paiements",
            divider: true,
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool divider;

  const NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.divider = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Color dividerColor = Colors.black26;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.13),
                radius: 23,
                child: Icon(icon, color: iconColor, size: 28),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (divider)
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Divider(
                thickness: 1.2,
                color: dividerColor,
                height: 1,
              ),
            ),
        ],
      ),
    );
  }
}
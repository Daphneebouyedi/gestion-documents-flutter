import 'package:flutter/material.dart';

class ParentBottomNavBar extends StatelessWidget {
  final int selected;
  final Function(int)? onTap;

  const ParentBottomNavBar({super.key, required this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: selected,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
        } else {
          // Navigation par défaut
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/parent/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/documents');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/notifications');
              break;
          }
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Documents"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
      ],
    );
  }
}

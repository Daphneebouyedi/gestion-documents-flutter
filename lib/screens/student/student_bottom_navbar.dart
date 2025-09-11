import 'package:flutter/material.dart';

class StudentBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const StudentBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      onTap: onTabSelected,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
        BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Documents"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ],
    );
  }
}

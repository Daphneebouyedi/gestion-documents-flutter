import 'package:flutter/material.dart';
import 'student_home_page.dart';
import 'student_documents_page.dart';
import 'student_profile_page.dart';
import 'student_document_request_page.dart';

class StudentMainScreen extends StatefulWidget {
  final int initialIndex;
  const StudentMainScreen({this.initialIndex = 0, Key? key}) : super(key: key);

  @override
  State<StudentMainScreen> createState() => _StudentMainScreenState();
}

class _StudentMainScreenState extends State<StudentMainScreen> {
  late int _selectedIndex;

  // Pages principales
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pages = [
      StudentHomePage(),        // Home
      StudentDocumentsPage(),   // Documents
       StudentProfilePage(),     // Profile
    ];
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Callback pour navigation depuis les boutons du HomePage
  void navigateToRequestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StudentDocumentRequestPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black12, width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home,
              label: "Home",
              selected: _selectedIndex == 0,
              onTap: () => _onTabSelected(0),
            ),
            _NavItem(
              icon: Icons.folder_open,
              label: "Documents",
              selected: _selectedIndex == 1,
              onTap: () => _onTabSelected(1),
            ),
            _NavItem(
              icon: Icons.person,
              label: "Profile",
              selected: _selectedIndex == 2,
              onTap: () => _onTabSelected(2),
            ),
          ],
        ),
      ),
    );
  }
}

// Barre de navigation bas
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black, size: 28),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

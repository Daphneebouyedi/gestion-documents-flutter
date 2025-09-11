import 'package:flutter/material.dart';

class StudentDocumentsPage extends StatelessWidget {
  const StudentDocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: turquoise,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0,1)),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.folder_open, size: 28),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Mes Documents",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: turquoise,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _DocumentTile(
                    icon: Icons.picture_as_pdf,
                    label: "Bulletin de notes",
                    onTap: () => Navigator.pushNamed(context, '/student/request'),
                  ),
                  _DocumentTile(
                    icon: Icons.upload_file,
                    label: "Téléverser un document",
                    onTap: () => Navigator.pushNamed(context, '/student/request'),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: turquoise,
            ),
          ],
        ),
      ),
    );
  }
}

class _DocumentTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DocumentTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF24B6AA)),
        title: Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
        trailing: Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StudentProfileEditPage extends StatefulWidget {
  const StudentProfileEditPage({super.key});

  @override
  State<StudentProfileEditPage> createState() => _StudentProfileEditPageState();
}

class _StudentProfileEditPageState extends State<StudentProfileEditPage> {
  final TextEditingController nameController = TextEditingController(text: "Laz Livith");
  final TextEditingController emailController = TextEditingController(text: "lazlivith77@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "+225 002-23-10-00");
  final TextEditingController yearController = TextEditingController(text: "2ème année");

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);

    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier Profil"),
        backgroundColor: turquoise,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _editField("Nom", nameController),
            SizedBox(height: 10),
            _editField("Email", emailController),
            SizedBox(height: 10),
            _editField("Téléphone", phoneController),
            SizedBox(height: 10),
            _editField("Année", yearController),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: turquoise, padding: EdgeInsets.symmetric(vertical: 14)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: turquoise, size: 48),
                        SizedBox(height: 12),
                        Text("Modifications enregistrées", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx),
                          style: ElevatedButton.styleFrom(backgroundColor: turquoise),
                          child: Text("Fermer", style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        TextField(controller: controller, decoration: InputDecoration(border: OutlineInputBorder())),
      ],
    );
  }
}

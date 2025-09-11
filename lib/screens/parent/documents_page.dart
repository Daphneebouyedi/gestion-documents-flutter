import 'package:flutter/material.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> documents = [
      {"title": "Bulletin 2023", "file": "bulletin.pdf"},
      {"title": "Attestation Scolarité", "file": "attestation.pdf"},
      {"title": "Diplôme", "file": "diplome.pdf"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Documents"),
        backgroundColor: const Color(0xFF24B6AA),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final doc = documents[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/view_document');
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.picture_as_pdf, color: Colors.redAccent),
                title: Text(doc["title"]!),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class StudentDocumentRequestPage extends StatefulWidget {
  const StudentDocumentRequestPage({super.key});

  @override
  State<StudentDocumentRequestPage> createState() => _StudentDocumentRequestPageState();
}

class _StudentDocumentRequestPageState extends State<StudentDocumentRequestPage> {
  String _selectedDoc = "Attestation de scolarité";
  final _detailsController = TextEditingController();

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
                  BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 1)),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Demande de document",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  Container(width: 34, height: 34), // Placeholder pour alignement
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Formulaire
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 2),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Type de document",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: _selectedDoc,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        ),
                        items: [
                          "Attestation de scolarité",
                          "Bulletin de notes",
                          "Diplôme",
                          "Autre",
                        ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (val) => setState(() => _selectedDoc = val ?? _selectedDoc),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Détails supplémentaires",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _detailsController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Entrez vos détails ici...",
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: turquoise,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Action de soumission
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Demande envoyée !")),
                            );
                          },
                          child: const Text(
                            "Envoyer la demande",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 50, color: turquoise),
          ],
        ),
      ),
    );
  }
}

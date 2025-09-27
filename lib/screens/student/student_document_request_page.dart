import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'convention_form_page.dart';
import 'student_upload_age.dart';
import 'attestation_form_page.dart';

class StudentDocumentRequestPage extends StatefulWidget {
  final Map<String, String>? currentUser; // <-- renommé pour correspondre à HomePage

  const StudentDocumentRequestPage({Key? key, this.currentUser}) : super(key: key);

  @override
  State<StudentDocumentRequestPage> createState() =>
      _StudentDocumentRequestPageState();
}

class _StudentDocumentRequestPageState
    extends State<StudentDocumentRequestPage> {
  String? _selectedDocument;

  final List<String> _documents = [
    'Attestation de scolarité',
    'Relevé de notes',
    'Convention de stage',
    'Autre document',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demande de document'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Choisir un document',
                border: OutlineInputBorder(),
              ),
              value: _selectedDocument,
              items: _documents
                  .map((doc) => DropdownMenuItem(
                        value: doc,
                        child: Text(doc),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDocument = value;
                });

                if (value == 'Convention de stage') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConventionFormPage()),
                  ).then((_) {
                    setState(() {
                      _selectedDocument = null;
                    });
                  });
                } else if (value == 'Attestation de scolarité') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AttestationForm(
                          currentUserData: widget.currentUser,
                        )),
                  ).then((_) {
                    setState(() {
                      _selectedDocument = null;
                    });
                  });
                } else if (value == 'Autre document') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentUploadPage()),
                  ).then((_) {
                    setState(() {
                      _selectedDocument = null;
                    });
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

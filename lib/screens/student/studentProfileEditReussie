import 'package:flutter/material.dart';

class StudentProfileEditSuccessDialog extends StatelessWidget {
  const StudentProfileEditSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Succès"),
      content: const Text("Profil mis à jour avec succès."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Ferme le dialogue
            Navigator.pushReplacementNamed(context, '/student/profile');
          },
          child: const Text("OK"),
        ),
      ],
    );
  }
}

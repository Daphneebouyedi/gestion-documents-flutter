import 'package:flutter/material.dart';

class StudentUploadPage extends StatelessWidget {
  const StudentUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);
    return Scaffold(
      appBar: AppBar(
        title: Text("Téléversement de document"),
        backgroundColor: turquoise,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: turquoise, width: 1.5),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload, color: turquoise, size: 48),
                      SizedBox(height: 8),
                      Text("Déposez votre fichier ou cliquez pour choisir", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: turquoise,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: Text("Envoyer", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

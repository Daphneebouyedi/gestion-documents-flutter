import 'package:flutter/material.dart';

class ParentDocumentViewPage extends StatelessWidget {
  const ParentDocumentViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Visualisation du PDF",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: turquoise,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/parent/documents');
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: turquoise, width: 1.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.picture_as_pdf, color: turquoise, size: 64),
              SizedBox(height: 12),
              Text(
                "PDF exemple",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: turquoise,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

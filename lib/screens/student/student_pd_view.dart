import 'package:flutter/material.dart';

class StudentPdfViewPage extends StatelessWidget {
  const StudentPdfViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualisation du PDF"),
        backgroundColor: turquoise,
        centerTitle: true,
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
            children: [
              Icon(Icons.picture_as_pdf, color: turquoise, size: 64),
              SizedBox(height: 12),
              Text("PDF exemple", textAlign: TextAlign.center, style: TextStyle(color: turquoise, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

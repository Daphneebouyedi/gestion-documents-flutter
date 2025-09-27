import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';

class ParentDocumentViewPage extends StatelessWidget {
  const ParentDocumentViewPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Visualisation du PDF",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
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
            color: lightGray,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: primaryColor, width: 1.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.picture_as_pdf, color: primaryColor, size: 64),
              SizedBox(height: 12),
              Text(
                "PDF exemple",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
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

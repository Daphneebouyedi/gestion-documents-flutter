import 'package:flutter/material.dart';

class StudentSearchPage extends StatelessWidget {
  const StudentSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);
    return Scaffold(
      appBar: AppBar(
        title: Text("Recherche"),
        backgroundColor: turquoise,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(child: TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "Rechercher un document"))),
                  Icon(Icons.search, color: turquoise),
                ],
              ),
            ),
            SizedBox(height: 16),
            _resultItem("Bulletin de notes", "12 avr. 2024"),
            _resultItem("Attestation de scolarité", "10 avr. 2024"),
            _resultItem("Diplôme", "05 avr. 2024"),
          ],
        ),
      ),
    );
  }

  Widget _resultItem(String title, String date) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade300)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(date, style: TextStyle(color: Colors.grey.shade600)),
        ],
      ),
    );
  }
}

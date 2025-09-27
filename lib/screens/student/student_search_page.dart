import 'package:flutter/material.dart';

class StudentSearchPage extends StatelessWidget {
  const StudentSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);

    // Exemple de résultats (à relier au backend plus tard)
    final List<Map<String, String>> results = [
      {"title": "Bulletin de notes", "date": "12 avr. 2024"},
      {"title": "Attestation de scolarité", "date": "10 avr. 2024"},
      {"title": "Diplôme", "date": "05 avr. 2024"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recherche"),
        backgroundColor: turquoise,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Champ recherche stylé
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: turquoise),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Rechercher un document",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      onChanged: (value) {
                        // TODO: implémenter filtrage backend si nécessaire
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Résultats
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final item = results[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        item['date']!,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
                      onTap: () {
                        // TODO: ouvrir le document correspondant
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

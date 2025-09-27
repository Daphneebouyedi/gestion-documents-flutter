import 'package:flutter/material.dart';

class ParentSearchPage extends StatelessWidget {
  final Map<String, String>? currentUserData;

  const ParentSearchPage({this.currentUserData, super.key});

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);

    // Exemple de résultats
    final List<Map<String, String>> results = [
      {"title": "Bulletin de notes", "date": "12 avr. 2024"},
      {"title": "Attestation de scolarité", "date": "10 avr. 2024"},
      {"title": "Diplôme", "date": "05 avr. 2024"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header parent ---
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/laz.jpg"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentUserData != null
                              ? currentUserData!['username'] ?? 'Parent'
                              : "Lambert Poulin",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          currentUserData != null
                              ? "${currentUserData!['email'] ?? 'parent@example.com'}"
                              : "jcoandelafuente@gmail.com",
                          style: const TextStyle(
                              fontSize: 12, fontStyle: FontStyle.italic),
                        ),
                        const Text(
                          "Parent",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications,
                        color: turquoise, size: 28),
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                ],
              ),
            ),

            // --- Barre de recherche ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                        // TODO: filtrage backend
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // --- Liste des résultats ---
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final item = results[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
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
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.black45),
                      onTap: () {
                        // TODO: ouvrir document
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

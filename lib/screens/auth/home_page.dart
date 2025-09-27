import 'package:flutter/material.dart';
import '../parent/parent_documents_page.dart';
import '../parent/parent_profile_page.dart';
import '../parent/parent_document_request_page.dart';
import '../parent/parent_notifications_page.dart';
import '../parent/parent_search_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, String>? currentUserData; // username, email...
  const HomePage({this.currentUserData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);
    const Color cardBg = Colors.white;

    return Scaffold(
      backgroundColor: turquoise,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header avec photo, nom, email, rôle, notifications ---
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Photo parent
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/laz.jpg"),
                        ),
                        const SizedBox(width: 16),
                        // Nom, email, rôle
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
                        // Notifications
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: turquoise, size: 28),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ParentNotificationsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Barre de recherche stylée
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParentSearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardBg,
                          border: Border.all(color: Colors.black12, width: 1.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                        child: Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Rechercher un document",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Icon(Icons.search, color: turquoise, size: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // --- Grille 2x2 comme StudentHomePage ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.9,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _HomeButton(
                      image: 'assets/doc.png',
                      label: "Demande de document",
                      imageHeight: 70,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParentDocumentRequestPage(),
                          ),
                        );
                      },
                    ),
                    _HomeButton(
                      image: 'assets/2.png',
                      label: "Profil étudiant",
                      imageHeight: 70,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParentProfilePage(),
                          ),
                        );
                      },
                    ),
                    _HomeButton(
                      image: 'assets/folder.png',
                      label: "Mes documents",
                      imageHeight: 100,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParentDocumentsPage(),
                          ),
                        );
                      },
                    ),
                    _HomeButton(
                      image: 'assets/payment.png',
                      label: "Suivi Paiement",
                      imageHeight: 70,
                      onTap: () {
                        Navigator.pushNamed(context, '/payments');
                      },
                    ),
                  ],
                ),
              ),
            ),

            Container(height: 30, color: turquoise),
          ],
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;
  final double imageHeight;

  const _HomeButton({
    required this.image,
    required this.label,
    required this.onTap,
    this.imageHeight = 52,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.shade200, width: 1.2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: imageHeight),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

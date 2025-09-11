import 'package:flutter/material.dart';
// ...existing code...
import 'student_documents_page.dart'; // <-- importe la page des documents
import 'student_document_request_page.dart'; // <-- importe la page des demandes de documents
import 'student_profile_page.dart'; // <-- importe la page de profil

class StudentHomePage extends StatelessWidget {
  final VoidCallback? onNavigateRequest;
  final VoidCallback? onNavigateDocuments;
  final VoidCallback? onNavigateProfile;

  const StudentHomePage({
    this.onNavigateRequest,
    this.onNavigateDocuments,
    this.onNavigateProfile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);
    const Color cardBg = Colors.white;

    return Scaffold(
      backgroundColor: turquoise,
      body: SafeArea(
        child: Column(
          children: [
            // --- Header et barre de recherche (inchangé) ---
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.menu, color: Colors.black, size: 28),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Accueil Etudiant",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            color: turquoise,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Stack(
                      children: [
                        Container(height: 2, width: double.infinity, color: turquoise),
                        Positioned(
                          right: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.diamond, color: turquoise, size: 17),
                              SizedBox(width: 2),
                              Text(
                                "icon",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: turquoise,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12, width: 1.2),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                      child: Row(
                        children: const [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Rechercher un document",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Icon(Icons.search, color: turquoise, size: 24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // --- Les Cards ---
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
                            builder: (context) => const StudentDocumentRequestPage(),
                          ),
                        );
                      },
                    ),
                    // _HomeButton Paiement supprimé
                    _HomeButton(
                      image: 'assets/2.png',
                      label: "Profil étudiant",
                      imageHeight: 70,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentProfilePage(),
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
                            builder: (context) => const StudentDocumentsPage(),
                          ),
                        );
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

import 'package:flutter/material.dart';
import '../student/student_documents_page.dart';
import '../student/student_document_request_page.dart';
import '../student/student_profile_page.dart';
import '../student/student_notifications_page.dart';
import '../student/student_search_page.dart';

class StudentHomePage extends StatelessWidget {
  final Map<String, String>? currentUser; // <-- renommé pour uniformité
  final VoidCallback? onNavigateRequest;
  final VoidCallback? onNavigateDocuments;
  final VoidCallback? onNavigateProfile;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSearchPressed;

  const StudentHomePage({
    this.currentUser,
    this.onNavigateRequest,
    this.onNavigateDocuments,
    this.onNavigateProfile,
    this.onNotificationPressed,
    this.onSearchPressed,
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
            // --- Header et barre de recherche ---
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
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
                        Expanded(
                          child: Center(
                            child: Text(
                              "Accueil Étudiant",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications,
                              color: turquoise, size: 28),
                          onPressed: onNotificationPressed ??
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentNotificationsPage(),
                                  ),
                                );
                              },
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
                    GestureDetector(
                      onTap: onSearchPressed ??
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentSearchPage(),
                              ),
                            );
                          },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black12, width: 1.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                        child: Row(
                          children: [
                            const Expanded(
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
                            const Icon(Icons.search, color: turquoise, size: 24),
                          ],
                        ),
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
                            builder: (context) =>
                                StudentDocumentRequestPage(currentUser: currentUser),
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

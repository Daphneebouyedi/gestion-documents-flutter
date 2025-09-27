import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/parent/parent_notifications_page.dart';
import 'package:flutter_application_1/screens/parent/parent_search_page.dart';
import 'package:flutter_application_1/screens/parent/parent_document_request_page.dart';
import 'package:flutter_application_1/screens/parent/parent_profile_page.dart';
import 'package:flutter_application_1/screens/parent/parent_documents_page.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/widgets/home_button.dart';

class HomePage extends StatelessWidget {
  final Map<String, String>? currentUserData; // username, email...
  const HomePage({this.currentUserData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color cardBg = whiteColor;

    return Scaffold(
      backgroundColor: primaryColor,
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
                    color: blackColor.withOpacity(0.12),
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
                              color: primaryColor, size: 28),
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
                          border: Border.all(color: blackColor.withOpacity(0.12), width: 1.2),
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
                                  color: blackColor.withOpacity(0.54),
                                ),
                              ),
                            ),
                            Icon(Icons.search, color: primaryColor, size: 24),
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
                    HomeButton(
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
                    HomeButton(
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
                    HomeButton(
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
                    HomeButton(
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

            Container(height: 30, color: primaryColor),
          ],
        ),
      ),
    );
  }
}

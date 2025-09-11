import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3DC6A9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3DC6A9),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Accueil Parent",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Barre de recherche
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Rechercher un document",
                  hintStyle: TextStyle(fontWeight: FontWeight.w600),
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Carte Bienvenue
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/laz.jpg"),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Lambert Poulin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "jcoandelafuente@gmail.com",
                        style: TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                      Text(
                        "Parent",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Grille 2x2 cliquable
            GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _menuCard(context, "Demande de document", "assets/doc.png", routeName: '/document_request'),
                _menuCard(context, "Suivi Paiement", "assets/payment.png", routeName: '/payments'),
                _menuCard(context, "Profil étudiant", "assets/profile2.png", routeName: '/profile'),
                _menuCard(context, "Mes documents", "assets/folder.png", routeName: '/documents'),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext context, String title, String imagePath,
      {required String routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

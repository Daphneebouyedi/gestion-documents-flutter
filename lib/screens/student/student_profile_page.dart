import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA); // couleur bouton Modifier et header
    const Color buttonRed = Color(0xFFE74C3C); // couleur bouton Déconnexion
    const Color textBlack = Colors.black;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Profil",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Photo de profil ronde
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'), // remplacer par ton image
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 16),
                // Nom
                const Text(
                  "Laz Livith",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                // Année
                const Text(
                  "2ème année",
                  style: TextStyle(
                    fontSize: 16,
                    color: textBlack,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 18),
                // Titre Informations personnels
                const Text(
                  "Informations personnels",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 12),
                // Carte info
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400, width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      InfoRow(label: "Laz Livith"),
                      InfoRow(label: "Lazdesire77@gmail.com"),
                      InfoRow(label: "+212 600-23-21-00"),
                      InfoRow(label: "42 rue des Ecoles, Casablanca"),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                // Bouton Modifier
                SizedBox(
                  width: 280,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/parent/profile_edit');
                    },
                    child: const Text(
                      "Modifier",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Bouton Déconnexion
                SizedBox(
                  width: 280,
                  height: 48,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: buttonRed, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    child: const Text(
                      "Deconnexion",
                      style: TextStyle(
                        color: buttonRed,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Documents"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          // Navigation selon l'index
          if (index == 0) Navigator.of(context).pushReplacementNamed('/student/home');
          if (index == 1) Navigator.of(context).pushReplacementNamed('/student/documents');
        },
      ),
    );
  }
}

// Widget pour les lignes d'informations
class InfoRow extends StatelessWidget {
  final String label;
  const InfoRow({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 15.5,
        ),
      ),
    );
  }
}

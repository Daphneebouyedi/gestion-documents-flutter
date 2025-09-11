import 'package:flutter/material.dart';
import 'parent_bottom_navbar.dart';

class ParentProfilePage extends StatelessWidget {
  const ParentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA); // bouton Modifier, flèche retour
    const Color textBlack = Colors.black;
    const Color buttonRed = Color(0xFFE74C3C); // bouton Déconnexion

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/parent/home');
          },
        ),
        title: Text(
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
                SizedBox(height: 20),
                // Photo profil ronde
                CircleAvatar(
                  radius: 54,
                  backgroundImage: AssetImage('assets/laz.jpg'),
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(height: 16),
                // Nom
                Text(
                  "Laz Livit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textBlack,
                  ),
                ),
                SizedBox(height: 4),
                // Année
                Text(
                  "2ème année",
                  style: TextStyle(
                    fontSize: 16,
                    color: textBlack,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: 18),
                // Titre Informations personnels
                Text(
                  "Informations personnels",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textBlack,
                  ),
                ),
                SizedBox(height: 12),
                // Carte info
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(label: "Laz Livith"),
                      InfoRow(label: "Lazdesire77@ynov.com"),
                      InfoRow(label: "212 600-23-21-00"),
                      InfoRow(label: "42 rue des Ecoles, casablanca"),
                    ],
                  ),
                ),
                SizedBox(height: 28),
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
                    child: Text(
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
                SizedBox(height: 16),
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
                    child: Text(
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
                SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  const InfoRow({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 15.5,
        ),
      ),
    );
  }
}
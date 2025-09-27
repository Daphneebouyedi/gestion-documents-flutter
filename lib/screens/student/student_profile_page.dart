import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
   final Map<String, String>? currentUserData; // Données simulées depuis login
  final VoidCallback? onNavigateRequest;
  final VoidCallback? onNavigateDocuments;
  final VoidCallback? onNavigateProfile;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSearchPressed;

  const StudentProfilePage({
     this.currentUserData,
    this.onNavigateRequest,
    this.onNavigateDocuments,
    this.onNavigateProfile,
    this.onNotificationPressed,
    this.onSearchPressed,
    Key? key,
    }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA); // couleur bouton Modifier et header
    const Color buttonRed = Color(0xFFE74C3C); // couleur bouton Déconnexion
    const Color textBlack = Colors.black;

    // Données de l'étudiant (peuvent être remplacées par des données dynamiques)
    const String firstName = "Laz";
    const String lastName = "Livith";
    const String email = "Lazdesire77@gmail.com";
    const String phone = "+212 600-23-21-00";
    const String address = "42 rue des Ecoles, Casablanca";
    const String country = "Maroc";
    const String region = "Casablanca";
    const String year = "B1";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () => Navigator.of(context).pop(),
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
                  backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 16),
                // Nom complet
                Text(
                  "$firstName $lastName",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 4),
                // Mail
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 16,
                    color: textBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                // Classe / Année
                Text(
                  year,
                  style: const TextStyle(
                    fontSize: 16,
                    color: textBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                // Titre Informations personnels
                const Text(
                  "Informations personnelles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textBlack,
                  ),
                ),
                const SizedBox(height: 12),
                // Carte info
                Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400, width: 1.5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoRow(label: "Nom: $lastName"),
                      InfoRow(label: "Prénom: $firstName"),
                      InfoRow(label: "Email: $email"),
                      InfoRow(label: "Téléphone: $phone"),
                      InfoRow(label: "Adresse: $address"),
                      InfoRow(label: "Pays: $country"),
                      InfoRow(label: "Région: $region"),
                      InfoRow(label: "Classe: $year"),
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/student/profile_edit');
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
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    },
                    child: const Text(
                      "Déconnexion",
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
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  const InfoRow({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black87, fontSize: 15.5),
      ),
    );
  }
}

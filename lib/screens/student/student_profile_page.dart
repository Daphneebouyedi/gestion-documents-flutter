import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart' as app_theme;
// import 'package:image_picker/image_picker.dart'; // Removed image_picker
// import 'dart:io'; // Removed dart:io

class StudentProfilePage extends StatelessWidget { // Changed back to StatelessWidget
  final Map<String, String>? currentUserData;
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
    // Use global primaryColor and buttonRed from theme.dart
    // const Color primaryColor = Color(0xFF24B6AA); // Removed local definition
    // const Color buttonRed = Color(0xFFE74C3C); // Removed local definition

    // Exemple de données (à remplacer par les données réelles)
    final String firstName = currentUserData?['firstName'] ?? "Laz"; // Get from currentUserData
    final String lastName = currentUserData?['lastName'] ?? "Livith"; // Get from currentUserData
    final String email = currentUserData?['email'] ?? "Lazdesire77@gmail.com"; // Get from currentUserData
    const String phone = "+212 600-23-21-00";
    const String address = "42 rue des Ecoles, Casablanca";
    const String country = "Maroc";
    const String region = "Casablanca";
    const String year = "B1";

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER AVEC COURBE
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: app_theme.primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      // Photo de profil
                      GestureDetector(
                        onTap: () {
                          // No image picking functionality
                        },
                        child: const CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage('assets/avatar.jpg'), // Always use avatar.jpg
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Nom
                      Text(
                        "$firstName $lastName",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Email
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 80),

            // INFOS PERSONNELLES
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informations personnelles",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                    const Divider(height: 20, thickness: 1),
                    InfoTile(icon: Icons.phone, label: "Téléphone", value: phone),
                    InfoTile(icon: Icons.location_on, label: "Adresse", value: address),
                    InfoTile(icon: Icons.flag, label: "Pays", value: country),
                    InfoTile(icon: Icons.map, label: "Région", value: region),
                    InfoTile(icon: Icons.school, label: "Promotion", value: currentUserData?['promotion'] ?? year),
                    InfoTile(icon: Icons.bookmark, label: "Spécialité", value: currentUserData?['speciality'] ?? "Non définie"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // BOUTONS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: app_theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/student/profile_edit');
                      },
                      child: const Text(
                        "Modifier",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: app_theme.buttonRed, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                      },
                      child: const Text(
                        "Déconnexion",
                        style: TextStyle(
                          color: app_theme.buttonRed,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: app_theme.primaryColor, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$label : $value",
              style: const TextStyle(fontSize: 15.5, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

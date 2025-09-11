import 'package:flutter/material.dart';

class ErrorAccessDeniedPage extends StatelessWidget {
  const ErrorAccessDeniedPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 340, // for nice margin on mobile
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                SizedBox(height: 12),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Erreur",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                // turquoise line
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 4,
                  color: turquoise,
                ),
                SizedBox(height: 38),
                // Icone carré turquoise + exclamation
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: turquoise,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 68,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                // Texte "Accès refusé"
                Center(
                  child: Text(
                    "Accès\nrefusé",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      letterSpacing: 1,
                      fontFamily: 'Roboto', // change font if you want more "block" effect
                    ),
                  ),
                ),
                SizedBox(height: 52),
                // Bouton retour accueil
                Center(
                  child: SizedBox(
                    width: 260,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: turquoise,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/student/home', // adapte la route à ton app
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Retour à la page d'accueil",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ParentProfileEditSuccessPage extends StatelessWidget {
  const ParentProfileEditSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 340,
          padding: EdgeInsets.symmetric(vertical: 44, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 4)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: primaryColor, size: 69),
              SizedBox(height: 32),
              Text("Modifications enregistrées", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 12),
              Text(
                "Vos informations ont bien été mis à jour.",
                style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/parent/profile');
                  },
                  child: Text("Fermer", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
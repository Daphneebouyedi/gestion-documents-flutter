import 'package:flutter/material.dart';

class ParentProfileEditPage extends StatelessWidget {
  const ParentProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(58),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/parent/profile');
            },
          ),
          title: Text(
            "Profil",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 21,
              letterSpacing: 1.2,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Formulaires", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Laz Livith",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Lazdesire77@Ynov.com",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "+212 600-23-21-00",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "42 rue des Ecoles, casablanca",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/parent/profile');
                    },
                    child: Text("Annuler"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/parent/profile_edit_success');
                    },
                    child: Text("Enregistrer", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
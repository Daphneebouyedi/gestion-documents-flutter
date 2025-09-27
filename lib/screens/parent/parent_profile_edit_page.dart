import 'package:flutter/material.dart';

class ParentProfileEditPage extends StatefulWidget {
  const ParentProfileEditPage({super.key});

  @override
  State<ParentProfileEditPage> createState() => _ParentProfileEditPageState();
}

class _ParentProfileEditPageState extends State<ParentProfileEditPage> {
  final TextEditingController firstNameController =
      TextEditingController(text: "Laz");
  final TextEditingController lastNameController =
      TextEditingController(text: "Livith");
  final TextEditingController emailController =
      TextEditingController(text: "Lazdesire77@gmail.com");
  final TextEditingController phoneController =
      TextEditingController(text: "+212 600-23-21-00");
  final TextEditingController addressController =
      TextEditingController(text: "42 rue des Ecoles, Casablanca");
  final TextEditingController countryController =
      TextEditingController(text: "Maroc");
  final TextEditingController regionController =
      TextEditingController(text: "Casablanca");
  final TextEditingController yearController =
      TextEditingController(text: "2ème année");

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier Profil"),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _editField("Prénom", firstNameController),
            const SizedBox(height: 10),
            _editField("Nom", lastNameController),
            const SizedBox(height: 10),
            _editField("Email", emailController),
            const SizedBox(height: 10),
            _editField("Téléphone", phoneController),
            const SizedBox(height: 10),
            _editField("Adresse", addressController),
            const SizedBox(height: 10),
            _editField("Pays", countryController),
            const SizedBox(height: 10),
            _editField("Région", regionController),
            const SizedBox(height: 10),
            _editField("Classe / Année", yearController),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle,
                            color: primaryColor, size: 48),
                        const SizedBox(height: 12),
                        const Text(
                          "Modifications enregistrées",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => Navigator.pop(ctx),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: primaryColor),
                          child: const Text(
                            "Fermer",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _editField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

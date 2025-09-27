import 'package:flutter/material.dart';
import '../../models/user.dart'; // Import pour le User

/// Définition des couleurs (équivalentes au :root CSS)
class AppColors {
  static const primary = Color(0xFF4ECDC4);
  static const secondary = Color(0xFF2D3748);
  static const lightGray = Color(0xFFF7FAFC);
  static const mediumGray = Color(0xFFE2E8F0);
  static const darkGray = Color(0xFFA0AEC0);
  static const white = Colors.white;
  static const error = Color(0xFFE53E3E);
}

/// Styles généraux équivalents au CSS
class AppStyles {
  static BoxDecoration contentWrapper = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 15,
        offset: const Offset(0, 4),
      )
    ],
  );

  static TextStyle headerTitle = const TextStyle(
    color: AppColors.secondary,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle legendStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );

  static TextStyle labelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: labelStyle,
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.mediumGray),
        borderRadius: BorderRadius.circular(4),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  static ButtonStyle generateButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );

  static ButtonStyle cancelButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.mediumGray,
    foregroundColor: AppColors.secondary,
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  );
}

/// Formulaire Attestation avec pré-remplissage depuis currentUser
class AttestationForm extends StatefulWidget {
  final Map<String, String>? currentUserData; // Données simulées depuis login
  final VoidCallback? onNavigateRequest;
  final VoidCallback? onNavigateDocuments;
  final VoidCallback? onNavigateProfile;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSearchPressed;
  final User? currentUser;

  const AttestationForm({
     this.currentUserData,
    this.onNavigateRequest,
    this.onNavigateDocuments,
    this.onNavigateProfile,
    this.onNotificationPressed,
    this.onSearchPressed,
    super.key, this.currentUser});

  @override
  State<AttestationForm> createState() => _AttestationFormState();
}

class _AttestationFormState extends State<AttestationForm> {
  final _formKey = GlobalKey<FormState>();

  late Map<String, dynamic> formData;

  @override
  void initState() {
    super.initState();

    // Pré-remplissage uniquement avec les champs existants dans User
    formData = {
      "nom":  "",
      "prenom": "",
      "dateNaissance": "",
      "promotion": "",
      "specialite": "",
      "anneeScolaire": "",
      "modalitePaiement": "",
      "fraisPreinscription": "",
      "fraisScolarite": "",
      "totalPaye": "",
      "modePaiement": "",
      "date": DateTime.now().toString().substring(0, 10),
    };
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint("📄 Attestation demandée avec: $formData");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("✅ Attestation demandée avec succès !")),
      );
      Navigator.pushNamed(context, "/documents-transferts");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Attestation de frais"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: AppStyles.contentWrapper,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/ynov.png", width: 100, height: 100),
                    const SizedBox(height: 16),
                    Text(
                      "Demander une attestation de frais de scolarité",
                      style: AppStyles.headerTitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Text("Informations de l'Étudiant", style: AppStyles.legendStyle),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: formData["nom"],
                  decoration: AppStyles.inputDecoration("Nom"),
                  onSaved: (val) => formData["nom"] = val,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: formData["prenom"],
                  decoration: AppStyles.inputDecoration("Prénom"),
                  onSaved: (val) => formData["prenom"] = val,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  initialValue: formData["dateNaissance"],
                  decoration: AppStyles.inputDecoration("Date de naissance"),
                  onSaved: (val) => formData["dateNaissance"] = val,
                ),

                const SizedBox(height: 30),
                Text("Informations de la Formation", style: AppStyles.legendStyle),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: AppStyles.inputDecoration("Promotion"),
                  value: formData["promotion"].isEmpty ? null : formData["promotion"],
                  items: const [
                    DropdownMenuItem(value: "B1", child: Text("Bachelor 1")),
                    DropdownMenuItem(value: "B2", child: Text("Bachelor 2")),
                    DropdownMenuItem(value: "B3", child: Text("Bachelor 3")),
                    DropdownMenuItem(value: "M1", child: Text("Mastère 1")),
                    DropdownMenuItem(value: "M2", child: Text("Mastère 2")),
                  ],
                  onChanged: (val) => setState(() => formData["promotion"] = val ?? ""),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: AppStyles.inputDecoration("Spécialité"),
                  value: formData["specialite"].isEmpty ? null : formData["specialite"],
                  items: const [
                    DropdownMenuItem(value: "Data IA", child: Text("Data IA")),
                    DropdownMenuItem(value: "Développement", child: Text("Développement")),
                    DropdownMenuItem(value: "Cybersécurité", child: Text("Cybersécurité")),
                    DropdownMenuItem(value: "Informatique", child: Text("Informatique")),
                  ],
                  onChanged: (val) => setState(() => formData["specialite"] = val ?? ""),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: AppStyles.inputDecoration("Année scolaire"),
                  onSaved: (val) => formData["anneeScolaire"] = val,
                ),

                const SizedBox(height: 30),
                Text("Détails du Paiement", style: AppStyles.legendStyle),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  decoration: AppStyles.inputDecoration("Modalité de paiement"),
                  value: formData["modalitePaiement"].isEmpty ? null : formData["modalitePaiement"],
                  items: const [
                    DropdownMenuItem(value: "Trismestrielle", child: Text("Trismestrielle")),
                    DropdownMenuItem(value: "Semestrielle", child: Text("Semestrielle")),
                    DropdownMenuItem(value: "Un coup", child: Text("Un coup")),
                  ],
                  onChanged: (val) => setState(() => formData["modalitePaiement"] = val ?? ""),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: AppStyles.inputDecoration("Frais de préinscription (MAD)"),
                  onSaved: (val) => formData["fraisPreinscription"] = val,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: AppStyles.inputDecoration("Frais de scolarité (MAD)"),
                  onSaved: (val) => formData["fraisScolarite"] = val,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: AppStyles.inputDecoration("Total payé (MAD)"),
                  onSaved: (val) => formData["totalPaye"] = val,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  decoration: AppStyles.inputDecoration("Mode de paiement"),
                  value: formData["modePaiement"].isEmpty ? null : formData["modePaiement"],
                  items: const [
                    DropdownMenuItem(value: "CB", child: Text("Carte bancaire")),
                    DropdownMenuItem(value: "Virement", child: Text("Virement bancaire")),
                    DropdownMenuItem(value: "Cheque", child: Text("Chèque")),
                    DropdownMenuItem(value: "Especes", child: Text("Espèces")),
                  ],
                  onChanged: (val) => setState(() => formData["modePaiement"] = val ?? ""),
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: AppStyles.generateButton,
                      onPressed: _handleSubmit,
                      child: const Text("Demander une attestation"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      style: AppStyles.cancelButton,
                      onPressed: () => Navigator.pushNamed(context, "/dashboard"),
                      child: const Text("Annuler"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

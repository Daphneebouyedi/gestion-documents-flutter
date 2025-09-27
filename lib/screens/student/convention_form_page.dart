import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';

class ConventionFormPage extends StatefulWidget {
  @override
  _ConventionFormPageState createState() => _ConventionFormPageState();
}

class _ConventionFormPageState extends State<ConventionFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form data controllers
  final _dateDebutController = TextEditingController();
  final _dateFinController = TextEditingController();
  final _stagiaireNomController = TextEditingController();
  final _stagiairePrenomController = TextEditingController();
  String _stagiaireCivilite = 'Monsieur';
  final _stagiaireAdresseController = TextEditingController();
  final _stagiaireCodePostalController = TextEditingController();
  final _stagiaireVilleController = TextEditingController();
  final _stagiaireTelephoneController = TextEditingController();
  final _stagiaireEmailController = TextEditingController();
  final _entrepriseTypeController = TextEditingController();
  final _entrepriseNomController = TextEditingController();
  final _entrepriseAdresseController = TextEditingController();
  final _entrepriseCodePostalController = TextEditingController();
  final _entrepriseVilleController = TextEditingController();
  final _entreprisePaysController = TextEditingController();
  final _entrepriseTelephoneController = TextEditingController();
  final _entrepriseFaxController = TextEditingController();
  final _entrepriseSiteWebController = TextEditingController();
  final _entrepriseNbEmployesController = TextEditingController();
  final _representantNomController = TextEditingController();
  final _representantPrenomController = TextEditingController();
  String _representantCivilite = 'Monsieur';
  final _representantFonctionController = TextEditingController();
  final _representantTelephoneController = TextEditingController();
  final _representantEmailController = TextEditingController();
  final _tachesController = TextEditingController();
  final _environnementTechnoController = TextEditingController();
  final _formationsController = TextEditingController();
  final _objectifsController = TextEditingController();
  final _nbCollaborateursController = TextEditingController();
  final _commentairesController = TextEditingController();
  final _indemniteMontantController = TextEditingController();
  String _indemniteMonnaie = 'EUROS';
  final _indemniteCommentaireController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers
    _dateDebutController.dispose();
    _dateFinController.dispose();
    _stagiaireNomController.dispose();
    _stagiairePrenomController.dispose();
    _stagiaireAdresseController.dispose();
    _stagiaireCodePostalController.dispose();
    _stagiaireVilleController.dispose();
    _stagiaireTelephoneController.dispose();
    _stagiaireEmailController.dispose();
    _entrepriseTypeController.dispose();
    _entrepriseNomController.dispose();
    _entrepriseAdresseController.dispose();
    _entrepriseCodePostalController.dispose();
    _entrepriseVilleController.dispose();
    _entreprisePaysController.dispose();
    _entrepriseTelephoneController.dispose();
    _entrepriseFaxController.dispose();
    _entrepriseSiteWebController.dispose();
    _entrepriseNbEmployesController.dispose();
    _representantNomController.dispose();
    _representantPrenomController.dispose();
    _representantFonctionController.dispose();
    _representantTelephoneController.dispose();
    _representantEmailController.dispose();
    _tachesController.dispose();
    _environnementTechnoController.dispose();
    _formationsController.dispose();
    _objectifsController.dispose();
    _nbCollaborateursController.dispose();
    _commentairesController.dispose();
    _indemniteMontantController.dispose();
    _indemniteCommentaireController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
       builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Demande en cours d\'une convention de stage...')),
      );
      // In a real app, you would save the data to a backend here
      print('Form data submitted');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _buildTheme(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Demander une convention de Stage',
            style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: mediumGray,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: secondaryColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              // Assuming you have 'Ynov.png' in your 'assets' folder
              // and have added 'assets/Ynov.png' to pubspec.yaml
              child: Icon(Icons.school, color: primaryColor, size: 40),
            )
          ],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(0, 4),
                )
              ]
            ),
            constraints: BoxConstraints(maxWidth: 900),
            margin: EdgeInsets.all(16),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection(
                      title: 'Période de stage',
                      children: [
                        _buildDateField(context, 'Date de début', _dateDebutController),
                        _buildDateField(context, 'Date de fin', _dateFinController),
                      ],
                    ),
                    _buildSection(
                      title: 'Le Stagiaire',
                      children: [
                        _buildTextField('Nom', _stagiaireNomController),
                        _buildTextField('Prénom', _stagiairePrenomController),
                        _buildDropdownField('Civilité', _stagiaireCivilite, ['Monsieur', 'Madame'], (val) => setState(() => _stagiaireCivilite = val!)),
                        _buildTextField('Adresse', _stagiaireAdresseController, fullWidth: true),
                        _buildTextField('Code Postal', _stagiaireCodePostalController, inputType: TextInputType.number),
                        _buildTextField('Ville', _stagiaireVilleController),
                        _buildTextField('Téléphone', _stagiaireTelephoneController, inputType: TextInputType.phone),
                        _buildTextField('Adresse E-mail', _stagiaireEmailController, inputType: TextInputType.emailAddress),
                      ],
                    ),
                    _buildSection(
                      title: 'L\'Entreprise',
                      children: [
                        _buildTextField('Type d\'entreprise', _entrepriseTypeController, isRequired: false),
                        _buildTextField('Nom de l\'entreprise', _entrepriseNomController),
                        _buildTextField('Adresse', _entrepriseAdresseController, fullWidth: true),
                        _buildTextField('Code Postal', _entrepriseCodePostalController, inputType: TextInputType.number),
                        _buildTextField('Ville', _entrepriseVilleController),
                        _buildTextField('Pays', _entreprisePaysController, isRequired: false),
                        _buildTextField('Téléphone', _entrepriseTelephoneController, inputType: TextInputType.phone, isRequired: false),
                        _buildTextField('Fax', _entrepriseFaxController, inputType: TextInputType.phone, isRequired: false),
                        _buildTextField('Site Web', _entrepriseSiteWebController, inputType: TextInputType.url, isRequired: false),
                        _buildTextField('Nombre d\'employés', _entrepriseNbEmployesController, inputType: TextInputType.number, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Représentant de l\'entreprise',
                      children: [
                        _buildTextField('Nom', _representantNomController),
                        _buildTextField('Prénom', _representantPrenomController),
                        _buildDropdownField('Civilité', _representantCivilite, ['Monsieur', 'Madame'], (val) => setState(() => _representantCivilite = val!)),
                        _buildTextField('Fonction', _representantFonctionController, isRequired: false),
                        _buildTextField('Téléphone', _representantTelephoneController, inputType: TextInputType.phone, isRequired: false),
                        _buildTextField('Adresse E-mail', _representantEmailController, inputType: TextInputType.emailAddress, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Descriptif du stage',
                      singleColumn: true,
                      children: [
                        _buildTextField('Tâches quotidiennes', _tachesController, maxLines: 4, isRequired: false),
                        _buildTextField('Environnement technologique', _environnementTechnoController, maxLines: 4, isRequired: false),
                        _buildTextField('Formations prévues', _formationsController, maxLines: 4, isRequired: false),
                        _buildTextField('Objectifs pédagogiques', _objectifsController, maxLines: 4, isRequired: false),
                        _buildTextField('Nombre de collaborateurs', _nbCollaborateursController, inputType: TextInputType.number, isRequired: false),
                        _buildTextField('Commentaires', _commentairesController, maxLines: 4, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Indemnité de stage',
                      children: [
                        _buildTextField('Montant', _indemniteMontantController, inputType: TextInputType.number, isRequired: false),
                        _buildDropdownField('Monnaie', _indemniteMonnaie, ['EUROS', 'FCFA', 'MAD'], (val) => setState(() => _indemniteMonnaie = val!)),
                        _buildTextField('Commentaire', _indemniteCommentaireController, maxLines: 4, isRequired: false, fullWidth: true),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Demander une convention'),
                      ),
                    ),
                  ],
                ), 
              ),
            ),
          ),
        ),
      ),
    );
  }

  ThemeData _buildTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        primaryColor: primaryColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
          error: errorColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: mediumGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          labelStyle: TextStyle(color: secondaryColor, fontWeight: FontWeight.w500),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Segoe UI',
          bodyColor: secondaryColor,
          displayColor: secondaryColor,
        ),
      );
  }

  Widget _buildSection({required String title, required List<Widget> children, bool singleColumn = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: mediumGray.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor),
            ),
          ),
          singleColumn ? _buildSingleColumn(children) : _buildFormGrid(children),
        ],
      ),
    );
  }

  Widget _buildSingleColumn(List<Widget> children) {
    return Column(
      children: children.map((child) => Padding(padding: EdgeInsets.only(bottom: 16), child: child)).toList(),
    );
  }

  Widget _buildFormGrid(List<Widget> children) {
    return LayoutBuilder(builder: (context, constraints) {
      double itemWidth = (constraints.maxWidth / 2) - 12;
      if (constraints.maxWidth < 600) { // Use single column on smaller screens
        itemWidth = double.infinity;
      }
      return Wrap(
        spacing: 24,
        runSpacing: 16,
        children: children.map((widget) {
          if (widget is FormFieldWrapper && widget.fullWidth) {
            return SizedBox(width: double.infinity, child: widget);
          }
          return SizedBox(width: itemWidth, child: widget);
        }).toList(),
      );
    });
  }

  Widget _buildTextField(String label, TextEditingController controller, {TextInputType inputType = TextInputType.text, int maxLines = 1, bool isRequired = true, bool fullWidth = false}) {
    return FormFieldWrapper(
      fullWidth: fullWidth,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(labelText: label),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return 'Ce champ est obligatoire';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label, TextEditingController controller, {bool fullWidth = false}) {
    return FormFieldWrapper(
      fullWidth: fullWidth,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: Icon(Icons.calendar_today),
        ),
        readOnly: true,
        onTap: () => _selectDate(context, controller),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ est obligatoire';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdownField(String label, String currentValue, List<String> items, ValueChanged<String?> onChanged, {bool fullWidth = false}) {
    return FormFieldWrapper(
      fullWidth: fullWidth,
      child: DropdownButtonFormField<String>(
        value: currentValue,
        decoration: InputDecoration(labelText: label),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

// Helper widget to pass the fullWidth property through the widget tree
class FormFieldWrapper extends StatelessWidget {
  final Widget child;
  final bool fullWidth;
  const FormFieldWrapper({required this.child, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

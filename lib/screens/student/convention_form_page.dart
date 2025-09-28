import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';

class ConventionFormPage extends StatefulWidget {
  @override
  _ConventionFormPageState createState() => _ConventionFormPageState();
}

class _ConventionFormPageState extends State<ConventionFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _candidatNomController = TextEditingController();
  final _candidatPrenomController = TextEditingController();
  String _candidatCivilite = 'Monsieur';
  final _candidatDateNaissanceController = TextEditingController();
  final _candidatEmailController = TextEditingController();
  final _candidatTelephoneController = TextEditingController();
  final _candidatAdresseController = TextEditingController();

  final _responsableLegalNomController = TextEditingController();
  final _responsableLegalPrenomController = TextEditingController();
  String _responsableLegalCivilite = 'Monsieur';
  final _responsableLegalTelephoneController = TextEditingController();
  final _responsableLegalEmailController = TextEditingController();

  final _responsableFinancierNomController = TextEditingController();
  final _responsableFinancierPrenomController = TextEditingController();
  String _responsableFinancierCivilite = 'Monsieur';
  final _responsableFinancierTelephoneController = TextEditingController();
  final _responsableFinancierEmailController = TextEditingController();

  final _etudesAnterieuresController = TextEditingController();
  final _commentairesController = TextEditingController();

  @override
  void dispose() {
    _candidatNomController.dispose();
    _candidatPrenomController.dispose();
    _candidatDateNaissanceController.dispose();
    _candidatEmailController.dispose();
    _candidatTelephoneController.dispose();
    _candidatAdresseController.dispose();

    _responsableLegalNomController.dispose();
    _responsableLegalPrenomController.dispose();
    _responsableLegalTelephoneController.dispose();
    _responsableLegalEmailController.dispose();

    _responsableFinancierNomController.dispose();
    _responsableFinancierPrenomController.dispose();
    _responsableFinancierTelephoneController.dispose();
    _responsableFinancierEmailController.dispose();

    _etudesAnterieuresController.dispose();
    _commentairesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: primaryColor),
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
        SnackBar(content: Text('Demande de convention en cours...')),
      );
      print('Form submitted');
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
            'Demander une convention d\'étude',
            style: TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
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
              child: Icon(Icons.school, color: primaryColor, size: 40),
            ),
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
                ),
              ],
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
                      title: 'Candidat',
                      children: [
                        _buildTextField('Nom', _candidatNomController),
                        _buildTextField('Prénom', _candidatPrenomController),
                        _buildDropdownField('Civilité', _candidatCivilite, ['Monsieur', 'Madame'], (val) => setState(() => _candidatCivilite = val!)),
                        _buildDateField(context, 'Date de naissance', _candidatDateNaissanceController),
                        _buildTextField('Adresse', _candidatAdresseController, fullWidth: true),
                        _buildTextField('Téléphone', _candidatTelephoneController, inputType: TextInputType.phone),
                        _buildTextField('Email', _candidatEmailController, inputType: TextInputType.emailAddress),
                      ],
                    ),
                    _buildSection(
                      title: 'Responsable légal',
                      children: [
                        _buildTextField('Nom', _responsableLegalNomController),
                        _buildTextField('Prénom', _responsableLegalPrenomController),
                        _buildDropdownField('Civilité', _responsableLegalCivilite, ['Monsieur', 'Madame'], (val) => setState(() => _responsableLegalCivilite = val!)),
                        _buildTextField('Téléphone', _responsableLegalTelephoneController, inputType: TextInputType.phone, isRequired: false),
                        _buildTextField('Email', _responsableLegalEmailController, inputType: TextInputType.emailAddress, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Responsable financier',
                      children: [
                        _buildTextField('Nom', _responsableFinancierNomController),
                        _buildTextField('Prénom', _responsableFinancierPrenomController),
                        _buildDropdownField('Civilité', _responsableFinancierCivilite, ['Monsieur', 'Madame'], (val) => setState(() => _responsableFinancierCivilite = val!)),
                        _buildTextField('Téléphone', _responsableFinancierTelephoneController, inputType: TextInputType.phone, isRequired: false),
                        _buildTextField('Email', _responsableFinancierEmailController, inputType: TextInputType.emailAddress, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Études antérieures',
                      singleColumn: true,
                      children: [
                        _buildTextField('Détails', _etudesAnterieuresController, maxLines: 4, fullWidth: true, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Commentaires',
                      singleColumn: true,
                      children: [
                        _buildTextField('Commentaires', _commentairesController, maxLines: 4, fullWidth: true, isRequired: false),
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
      if (constraints.maxWidth < 600) {
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

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType inputType = TextInputType.text,
      int maxLines = 1,
      bool isRequired = true,
      bool fullWidth = false}) {
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

  Widget _buildDateField(BuildContext context, String label, TextEditingController controller,
      {bool fullWidth = false}) {
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

  Widget _buildDropdownField(String label, String currentValue, List<String> items, ValueChanged<String?> onChanged,
      {bool fullWidth = false}) {
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

class FormFieldWrapper extends StatelessWidget {
  final Widget child;
  final bool fullWidth;
  const FormFieldWrapper({required this.child, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class ConventionEtudeForm extends StatefulWidget {
  const ConventionEtudeForm({Key? key}) : super(key: key);

  @override
  ConventionEtudeFormState createState() => ConventionEtudeFormState();
}

class ConventionEtudeFormState extends State<ConventionEtudeForm> {
  final _formKey = GlobalKey<FormState>();

  // ----------------- Contrôleurs pour le candidat -----------------
  final _nomCandidatController = TextEditingController(text: "DUPONT");
  final _prenomCandidatController = TextEditingController(text: "Sophie");
  String civiliteCandidat = "Mme";
  final _dateNaissanceCandidatController = TextEditingController(text: "2005-08-20");
  final _lieuNaissanceCandidatController = TextEditingController(text: "Marseille");
  final _paysCandidatController = TextEditingController(text: "France");
  final _nationaliteCandidatController = TextEditingController(text: "Française");
  final _adresseCandidatController = TextEditingController(text: "5 Allée des Palmiers");
  final _villeCandidatController = TextEditingController(text: "Nice");
  final _codePostalCandidatController = TextEditingController(text: "06000");
  final _telephoneCandidatController = TextEditingController(text: "0493000000");
  final _portableCandidatController = TextEditingController(text: "0600000000");
  final _emailCandidatController = TextEditingController(text: "sophie.dupont@mail.com");
  final _idCandidatController = TextEditingController(text: "ID12345678");

  // ----------------- Responsable légal -----------------
  String civiliteRespLegal = "Mr";
  String qualiteRespLegal = "Père";
  final _nomRespLegalController = TextEditingController(text: "DUPONT");
  final _prenomRespLegalController = TextEditingController(text: "Marc");
  final _dateNaissanceRespLegalController = TextEditingController(text: "1975-01-01");
  final _lieuNaissanceRespLegalController = TextEditingController(text: "Paris");
  final _paysRespLegalController = TextEditingController(text: "France");
  final _nationaliteRespLegalController = TextEditingController(text: "Française");
  final _adresseRespLegalController = TextEditingController(text: "5 Allée des Palmiers");
  final _villeRespLegalController = TextEditingController(text: "Nice");
  final _codePostalRespLegalController = TextEditingController(text: "06000");
  final _telephoneRespLegalController = TextEditingController(text: "0493111111");
  final _portableRespLegalController = TextEditingController(text: "0611111111");
  final _emailRespLegalController = TextEditingController(text: "marc.dupont@mail.com");
  final _idRespLegalController = TextEditingController(text: "ID87654321");

  // ----------------- Responsable financier -----------------
  String civiliteRespFin = "Mr";
  String qualiteRespFin = "Père";
  final _nomRespFinController = TextEditingController(text: "DUPONT");
  final _prenomRespFinController = TextEditingController(text: "Marc");
  final _dateNaissanceRespFinController = TextEditingController(text: "1975-01-01");
  final _lieuNaissanceRespFinController = TextEditingController(text: "Paris");
  final _paysRespFinController = TextEditingController(text: "France");
  final _nationaliteRespFinController = TextEditingController(text: "Française");
  final _adresseRespFinController = TextEditingController(text: "5 Allée des Palmiers");
  final _villeRespFinController = TextEditingController(text: "Nice");
  final _codePostalRespFinController = TextEditingController(text: "06000");
  final _telephoneRespFinController = TextEditingController(text: "0493111111");
  final _emailRespFinController = TextEditingController(text: "marc.dupont@mail.com");
  final _idRespFinController = TextEditingController(text: "ID87654321");

  // ----------------- Études antérieures -----------------
  List<Map<String, dynamic>> etudes = [
    {
      "annee": "2023-2024",
      "etudeSuivie": "Terminales",
      "etablissement": "Lycée Fénelon",
      "diplome": "Baccalauréat",
      "dateObtention": "2024-07-05"
    },
    {
      "annee": "2022-2023",
      "etudeSuivie": "Première",
      "etablissement": "Lycée Fénelon",
      "diplome": "N/A",
      "dateObtention": "2023-07-05"
    },
  ];

  final _commentaireController = TextEditingController(
      text: "Année de césure en 2020-2021 pour un voyage humanitaire au Pérou.");

  XFile? photoCandidat;

  @override
  void dispose() {
    _nomCandidatController.dispose();
    _prenomCandidatController.dispose();
    _dateNaissanceCandidatController.dispose();
    _lieuNaissanceCandidatController.dispose();
    _paysCandidatController.dispose();
    _nationaliteCandidatController.dispose();
    _adresseCandidatController.dispose();
    _villeCandidatController.dispose();
    _codePostalCandidatController.dispose();
    _telephoneCandidatController.dispose();
    _portableCandidatController.dispose();
    _emailCandidatController.dispose();
    _idCandidatController.dispose();

    _nomRespLegalController.dispose();
    _prenomRespLegalController.dispose();
    _dateNaissanceRespLegalController.dispose();
    _lieuNaissanceRespLegalController.dispose();
    _paysRespLegalController.dispose();
    _nationaliteRespLegalController.dispose();
    _adresseRespLegalController.dispose();
    _villeRespLegalController.dispose();
    _codePostalRespLegalController.dispose();
    _telephoneRespLegalController.dispose();
    _portableRespLegalController.dispose();
    _emailRespLegalController.dispose();
    _idRespLegalController.dispose();

    _nomRespFinController.dispose();
    _prenomRespFinController.dispose();
    _dateNaissanceRespFinController.dispose();
    _lieuNaissanceRespFinController.dispose();
    _paysRespFinController.dispose();
    _nationaliteRespFinController.dispose();
    _adresseRespFinController.dispose();
    _villeRespFinController.dispose();
    _codePostalRespFinController.dispose();
    _telephoneRespFinController.dispose();
    _emailRespFinController.dispose();
    _idRespFinController.dispose();

    _commentaireController.dispose();
    super.dispose();
  }

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        photoCandidat = image;
      });
    }
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
        SnackBar(content: Text('Demande en cours d\'une convention d\'étude...')),
      );
      // In a real app, you would save the data to a backend here
      print('Form data submitted');
      // Navigator.pop(context);
    }
  }

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();

    final image = photoCandidat != null
        ? pw.MemoryImage(await photoCandidat!.readAsBytes())
        : null;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text("CONVENTION D'ÉTUDE",
                style: pw.TextStyle(
                    fontSize: 22, fontWeight: pw.FontWeight.bold)),
          ),
          if (image != null)
            pw.Align(
              alignment: pw.Alignment.topRight,
              child: pw.Container(
                width: 80,
                height: 100,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.blue, width: 1),
                ),
                child: pw.Image(image, fit: pw.BoxFit.cover),
              ),
            ),
          pw.SizedBox(height: 20),
          pw.Text("État civil du candidat",
              style: pw.TextStyle(
                  fontSize: 14,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold,
                  background: pw.BoxDecoration(color: PdfColors.blue))),
          pw.SizedBox(height: 5),
          pw.Bullet(text: "Nom : ${_nomCandidatController.text}"),
          pw.Bullet(text: "Prénom : ${_prenomCandidatController.text}"),
          pw.Bullet(
              text:
                  "Date de naissance : ${_dateNaissanceCandidatController.text}"),
          pw.Bullet(text: "Lieu : ${_lieuNaissanceCandidatController.text} (${_paysCandidatController.text})"),
          pw.Bullet(text: "Nationalité : ${_nationaliteCandidatController.text}"),
          pw.Bullet(text: "Adresse : ${_adresseCandidatController.text}, ${_codePostalCandidatController.text} ${_villeCandidatController.text}"),
          pw.Bullet(text: "Email : ${_emailCandidatController.text}"),
          pw.Bullet(text: "Téléphone : ${_telephoneCandidatController.text} / ${_portableCandidatController.text}"),
          pw.Bullet(text: "ID/Passeport : ${_idCandidatController.text}"),
          pw.Bullet(text: "Civilité : $civiliteCandidat"),

          pw.SizedBox(height: 15),
          pw.Text("État civil du responsable légal",
              style: pw.TextStyle(
                  fontSize: 14,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold,
                  background: pw.BoxDecoration(color: PdfColors.blue))),
          pw.SizedBox(height: 5),
          pw.Bullet(text: "Nom : ${_nomRespLegalController.text}"),
          pw.Bullet(text: "Prénom : ${_prenomRespLegalController.text}"),
          pw.Bullet(
              text:
                  "Date de naissance : ${_dateNaissanceRespLegalController.text}"),
          pw.Bullet(text: "Lieu : ${_lieuNaissanceRespLegalController.text} (${_paysRespLegalController.text})"),
          pw.Bullet(text: "Nationalité : ${_nationaliteRespLegalController.text}"),
          pw.Bullet(text: "Adresse : ${_adresseRespLegalController.text}, ${_codePostalRespLegalController.text} ${_villeRespLegalController.text}"),
          pw.Bullet(text: "Email : ${_emailRespLegalController.text}"),
          pw.Bullet(text: "Téléphone : ${_telephoneRespLegalController.text} / ${_portableRespLegalController.text}"),
          pw.Bullet(text: "ID/Passeport : ${_idRespLegalController.text}"),
          pw.Bullet(text: "Civilité : $civiliteRespLegal"),

          pw.SizedBox(height: 15),
          pw.Text("État civil du responsable financier",
              style: pw.TextStyle(
                  fontSize: 14,
                  color: PdfColors.white,
                  fontWeight: pw.FontWeight.bold,
                  background: pw.BoxDecoration(color: PdfColors.blue))),
          pw.SizedBox(height: 5),
          pw.Bullet(text: "Nom : ${_nomRespFinController.text}"),
          pw.Bullet(text: "Prénom : ${_prenomRespFinController.text}"),
          pw.Bullet(
              text:
                  "Date de naissance : ${_dateNaissanceRespFinController.text}"),
          pw.Bullet(text: "Lieu : ${_lieuNaissanceRespFinController.text} (${_paysRespFinController.text})"),
          pw.Bullet(text: "Nationalité : ${_nationaliteRespFinController.text}"),
          pw.Bullet(text: "Adresse : ${_adresseRespFinController.text}, ${_codePostalRespFinController.text} ${_villeRespFinController.text}"),
          pw.Bullet(text: "Email : ${_emailRespFinController.text}"),
          pw.Bullet(text: "Téléphone : ${_telephoneRespFinController.text}"),
          pw.Bullet(text: "ID/Passeport : ${_idRespFinController.text}"),
          pw.Bullet(text: "Civilité : $civiliteRespFin"),

          pw.SizedBox(height: 15),
          pw.Text("Études antérieures", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.TableHelper.fromTextArray(
            headers: ["Année", "Étude", "Établissement", "Diplôme", "Date"],
            data: etudes
                .map((e) => [
                      e["annee"]!,
                      e["etudeSuivie"]!,
                      e["etablissement"]!,
                      e["diplome"]!,
                      e["dateObtention"]!
                    ])
                .toList(),
          ),

          pw.SizedBox(height: 15),
          pw.Text("Commentaire : "),
          pw.Text(_commentaireController.text),
          pw.SizedBox(height: 40),
          pw.Text("Signatures : "),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text("Signature du candidat"),
              pw.Text("Signature du responsable légal"),
            ],
          )
        ],
      ),
    );

    return pdf.save();
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
            "Convention d'étude",
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
                      title: 'État civil du candidat',
                      children: [
                        _buildDropdownField('Civilité', civiliteCandidat, ['Mme', 'M.'], (val) => setState(() => civiliteCandidat = val!)),
                        _buildTextField('Nom', _nomCandidatController),
                        _buildTextField('Prénom', _prenomCandidatController),
                        _buildDateField(context, 'Date de naissance', _dateNaissanceCandidatController),
                        _buildTextField('Lieu de naissance', _lieuNaissanceCandidatController),
                        _buildTextField('Pays', _paysCandidatController),
                        _buildTextField('Nationalité', _nationaliteCandidatController),
                        _buildTextField('Adresse', _adresseCandidatController, fullWidth: true),
                        _buildTextField('Code Postal', _codePostalCandidatController, inputType: TextInputType.number),
                        _buildTextField('Ville', _villeCandidatController),
                        _buildTextField('Téléphone', _telephoneCandidatController, inputType: TextInputType.phone),
                        _buildTextField('Portable', _portableCandidatController, inputType: TextInputType.phone),
                        _buildTextField('Adresse E-mail', _emailCandidatController, inputType: TextInputType.emailAddress),
                        _buildTextField('ID Candidat', _idCandidatController, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Responsable légal',
                      children: [
                        _buildDropdownField('Civilité', civiliteRespLegal, ['Mme', 'M.'], (val) => setState(() => civiliteRespLegal = val!)),
                        _buildTextField('Qualité', TextEditingController(text: qualiteRespLegal)),
                        _buildTextField('Nom', _nomRespLegalController),
                        _buildTextField('Prénom', _prenomRespLegalController),
                        _buildDateField(context, 'Date de naissance', _dateNaissanceRespLegalController),
                        _buildTextField('Lieu de naissance', _lieuNaissanceRespLegalController),
                        _buildTextField('Pays', _paysRespLegalController),
                        _buildTextField('Nationalité', _nationaliteRespLegalController),
                        _buildTextField('Adresse', _adresseRespLegalController, fullWidth: true),
                        _buildTextField('Code Postal', _codePostalRespLegalController, inputType: TextInputType.number),
                        _buildTextField('Ville', _villeRespLegalController),
                        _buildTextField('Téléphone', _telephoneRespLegalController, inputType: TextInputType.phone),
                        _buildTextField('Portable', _portableRespLegalController, inputType: TextInputType.phone),
                        _buildTextField('Adresse E-mail', _emailRespLegalController, inputType: TextInputType.emailAddress),
                        _buildTextField('ID Responsable', _idRespLegalController, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Responsable financier',
                      children: [
                        _buildDropdownField('Civilité', civiliteRespFin, ['Mme', 'M.'], (val) => setState(() => civiliteRespFin = val!)),
                        _buildTextField('Qualité', TextEditingController(text: qualiteRespFin)),
                        _buildTextField('Nom', _nomRespFinController),
                        _buildTextField('Prénom', _prenomRespFinController),
                        _buildDateField(context, 'Date de naissance', _dateNaissanceRespFinController),
                        _buildTextField('Lieu de naissance', _lieuNaissanceRespFinController),
                        _buildTextField('Pays', _paysRespFinController),
                        _buildTextField('Nationalité', _nationaliteRespFinController),
                        _buildTextField('Adresse', _adresseRespFinController, fullWidth: true),
                        _buildTextField('Code Postal', _codePostalRespFinController, inputType: TextInputType.number),
                        _buildTextField('Ville', _villeRespFinController),
                        _buildTextField('Téléphone', _telephoneRespFinController, inputType: TextInputType.phone),
                        _buildTextField('Adresse E-mail', _emailRespFinController, inputType: TextInputType.emailAddress),
                        _buildTextField('ID Responsable', _idRespFinController, isRequired: false),
                      ],
                    ),
                    _buildSection(
                      title: 'Commentaires',
                      singleColumn: true,
                      children: [
                        _buildTextField('Commentaires', _commentaireController, maxLines: 4, isRequired: false, fullWidth: true),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text("Générer PDF"),
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
  const FormFieldWrapper({super.key, required this.child, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ConventionEtudeForm extends StatefulWidget {
  @override
  _ConventionEtudeFormState createState() => _ConventionEtudeFormState();
}

class _ConventionEtudeFormState extends State<ConventionEtudeForm> {
  // ----------------- Contrôleurs pour le candidat -----------------
  TextEditingController nomCandidat = TextEditingController(text: "DUPONT");
  TextEditingController prenomCandidat = TextEditingController(text: "Sophie");
  TextEditingController dateNaissanceCandidat = TextEditingController(text: "2005-08-20");
  TextEditingController lieuNaissanceCandidat = TextEditingController(text: "Marseille");
  TextEditingController paysCandidat = TextEditingController(text: "France");
  TextEditingController nationaliteCandidat = TextEditingController(text: "Française");
  TextEditingController adresseCandidat = TextEditingController(text: "5 Allée des Palmiers");
  TextEditingController villeCandidat = TextEditingController(text: "Nice");
  TextEditingController codePostalCandidat = TextEditingController(text: "06000");
  TextEditingController telephoneCandidat = TextEditingController(text: "0493000000");
  TextEditingController portableCandidat = TextEditingController(text: "0600000000");
  TextEditingController emailCandidat = TextEditingController(text: "sophie.dupont@mail.com");
  TextEditingController idCandidat = TextEditingController(text: "ID12345678");
  
  String civiliteCandidat = "Mme";

  // ----------------- Photo -----------------
  XFile? photoCandidat;

  // ----------------- Études -----------------
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

  TextEditingController commentaire = TextEditingController(
      text: "Année de césure en 2020-2021 pour un voyage humanitaire au Pérou.");

  // ----------------- Image Picker -----------------
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        photoCandidat = image;
      });
    }
  }

  // ----------------- Génération PDF -----------------
  Future<void> generatePdf() async {
    final pdf = pw.Document();

    final image = photoCandidat != null
        ? pw.MemoryImage(await photoCandidat!.readAsBytes())
        : null;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Center(
            child: pw.Text("CONVENTION D'ÉTUDE",
                style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Nom: ${nomCandidat.text}"),
                    pw.Text("Prénom: ${prenomCandidat.text}"),
                    pw.Text("Né(e) le: ${dateNaissanceCandidat.text}"),
                    pw.Text("Lieu/Pays: ${lieuNaissanceCandidat.text}, ${paysCandidat.text}"),
                    pw.Text("Nationalité: ${nationaliteCandidat.text}"),
                    pw.Text("Adresse: ${adresseCandidat.text}, ${codePostalCandidat.text} ${villeCandidat.text}"),
                    pw.Text("Téléphone/Portable: ${telephoneCandidat.text}/${portableCandidat.text}"),
                    pw.Text("Email: ${emailCandidat.text}"),
                    pw.Text("ID/Passeport: ${idCandidat.text}"),
                    pw.Text("Civilité: $civiliteCandidat"),
                  ]),
              if (image != null)
                pw.Container(width: 80, height: 100, child: pw.Image(image)),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text("ÉTUDES ANTÉRIEURES", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Table.fromTextArray(
            headers: ['Année', 'Étude', 'Établissement', 'Diplôme', 'Date'],
            data: etudes.map((e) => [
              e["annee"],
              e["etudeSuivie"],
              e["etablissement"],
              e["diplome"],
              e["dateObtention"]
            ]).toList(),
          ),
          pw.SizedBox(height: 20),
          pw.Text("Commentaires", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          pw.Text(commentaire.text),
        ],
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Convention d'Étude")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Civilité
            Row(
              children: [
                Text("Civilité: "),
                Radio(
                    value: "Mr",
                    groupValue: civiliteCandidat,
                    onChanged: (val) {
                      setState(() {
                        civiliteCandidat = val.toString();
                      });
                    }),
                Text("Mr"),
                Radio(
                    value: "Mme",
                    groupValue: civiliteCandidat,
                    onChanged: (val) {
                      setState(() {
                        civiliteCandidat = val.toString();
                      });
                    }),
                Text("Mme"),
              ],
            ),
            // Nom & Prénom
            TextField(controller: nomCandidat, decoration: InputDecoration(labelText: "Nom")),
            TextField(controller: prenomCandidat, decoration: InputDecoration(labelText: "Prénom")),
            // Date de naissance
            TextField(controller: dateNaissanceCandidat, decoration: InputDecoration(labelText: "Date de naissance")),
            // Photo
            Row(
              children: [
                ElevatedButton(onPressed: pickImage, child: Text("Ajouter Photo")),
                if (photoCandidat != null) Image.file(File(photoCandidat!.path), width: 80, height: 100),
              ],
            ),
            SizedBox(height: 20),
            // Bouton PDF
            ElevatedButton(
              onPressed: generatePdf,
              child: Text("Générer PDF"),
            )
          ],
        ),
      ),
    );
  }
}

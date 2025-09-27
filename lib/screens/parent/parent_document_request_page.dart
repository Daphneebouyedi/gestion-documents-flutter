import 'package:flutter_application_1/theme.dart';

class ParentDocumentRequestPage extends StatelessWidget {
  const ParentDocumentRequestPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: whiteColor),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/parent/home');
            },
          ),
          title: Text(
            "Demande de document",
            style: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Demande de document", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            SizedBox(height: 9),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGray,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              initialValue: "Attestation de scolarité",
              items: [
                DropdownMenuItem(value: "Attestation de scolarité", child: Text("Attestation de scolarité")),
                DropdownMenuItem(value: "Bulletin de notes", child: Text("Bulletin de notes")),
                DropdownMenuItem(value: "Diplôme", child: Text("Diplôme")),
              ],
              onChanged: (v) {},
            ),
            SizedBox(height: 16),
            Text("Elève", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 7),
            TextField(
              decoration: InputDecoration(
                hintText: "Lucie Durund",
                filled: true,
                fillColor: lightGray,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            SizedBox(height: 14),
            Text("Détails supplémentaires", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 7),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGray,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            SizedBox(height: 26),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: Text("Envoyer", style: TextStyle(fontSize: 18, color: whiteColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
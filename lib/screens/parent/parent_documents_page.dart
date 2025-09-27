import 'package:flutter_application_1/theme.dart';

class ParentDocumentsPage extends StatelessWidget {
  const ParentDocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Documents'),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Bouton + pour ajouter un document ---
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      backgroundColor: whiteColor,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Ajouter un document',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            // Liste des documents classiques du parent
                            ListTile(
                              leading: const Icon(Icons.picture_as_pdf, color: primaryColor),
                              title: const Text('Bulletin de notes'),
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: Logique pour ajouter ce document
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.picture_as_pdf, color: primaryColor),
                              title: const Text('Attestation de scolarité'),
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: Logique pour ajouter ce document
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.picture_as_pdf, color: primaryColor),
                              title: const Text('Diplôme'),
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: Logique pour ajouter ce document
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.picture_as_pdf, color: primaryColor),
                              title: const Text('Autre document'),
                              onTap: () {
                                Navigator.pop(context);
                                // TODO: Logique pour ajouter ce document
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter un document'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Liste des documents disponibles ---
            Expanded(
              child: ListView(
                children: [
                  _buildDocumentTile(context, 'Bulletin de notes', primaryColor),
                  _buildDocumentTile(context, 'Attestation de scolarité', primaryColor),
                  _buildDocumentTile(context, 'Diplôme', primaryColor),
                  // Ajouter d'autres documents ici si besoin
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentTile(BuildContext context, String title, Color primaryColor) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.picture_as_pdf, color: primaryColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.download, color: blackColor.withOpacity(0.54)),
              onPressed: () {
                // TODO: Télécharger le document
              },
            ),
            IconButton(
              icon: const Icon(Icons.visibility, color: blackColor.withOpacity(0.54)),
              onPressed: () {
                // TODO: Visualiser le document
              },
            ),
          ],
        ),
        onTap: () {
          // TODO: Optionnel, ouvrir un détail du document
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ParentDocumentViewPage extends StatelessWidget {
  const ParentDocumentViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF24B6AA);
    const Color pdfBg = Color(0xFFAED3FD);
    const Color pdfCorner = Color(0xFF1951A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black, size: 28),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/parent/documents');
            },
          ),
          title: Text(
            "Visualisation du PDF",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          // Barre turquoise sous le header
          Container(
            height: 5,
            width: double.infinity,
            color: primaryColor,
          ),
          SizedBox(height: 26),
          Center(
            child: Container(
              width: 250,
              height: 210,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade400, width: 1.5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 32,
                    left: 36,
                    child: CustomPaint(
                      size: Size(110, 110),
                      painter: PdfIconPainter(),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("P D F", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black, letterSpacing: 6)),
                        SizedBox(height: 4),
                        Text("P P T X", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black, letterSpacing: 6)),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Fonction agrandir à implémenter")),
                        );
                      },
                      child: Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.black26, width: 1),
                            top: BorderSide(color: Colors.black26, width: 1),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Icon(Icons.open_in_full, color: Colors.black, size: 26),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          // Bouton Telecharger
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade400, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Fonction Télécharger à implémenter")),
                  );
                },
                child: Text(
                  "Telecharger",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.6,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          // Bouton Imprimer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.grey.shade400, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Fonction Imprimer à implémenter")),
                  );
                },
                child: Text(
                  "Imprimer",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.6,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class PdfIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFAED3FD); // Use pdfBg if passed as parameter
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(18),
      ),
      paint,
    );
    Paint cornerPaint = Paint()..color = Color(0xFF1951A1);
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.34);
    path.lineTo(size.width * 0.7, 0);
    path.close();
    canvas.drawPath(path, cornerPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
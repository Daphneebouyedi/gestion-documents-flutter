import 'package:flutter/material.dart';

// Pages Étudiant
import 'screens/auth/student_login_page.dart';
import 'screens/student/student_main_screen.dart';
import 'screens/student/student_pd_view.dart';
import 'screens/student/student_upload_age.dart';
import 'screens/student/student_search_page.dart';
import 'screens/student/student_profile_edit_page.dart';
import 'screens/student/student_notifications_page.dart';
import 'screens/student/student_documents_page.dart';
import 'screens/student/convention_form_page.dart';
import 'screens/student/attestation_form_page.dart';

// Pages Parent
import 'screens/parent/parent_documents_page.dart'; // <-- import corrigé
import 'screens/parent/parent_profile_page.dart';
import 'screens/parent/parent_notifications_page.dart';
import 'screens/parent/parent_document_request_page.dart';
import 'screens/parent/parent_document_view_page.dart';
import 'screens/parent/parent_profile_edit_page.dart';
import 'screens/parent/parent_profile_edit_success_page.dart';
import 'screens/auth/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Scolaire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      routes: {
        // Page de connexion
        '/login': (context) => StudentLoginPage(),

        // Partie Étudiant - écran principal avec navigation
        '/student/home': (context) => StudentMainScreen(initialIndex: 0),
        '/student/documents': (context) => StudentMainScreen(initialIndex: 1),
        '/student/profile': (context) => StudentMainScreen(initialIndex: 2),
        '/student/request': (context) => StudentMainScreen(initialIndex: 3),

        // Pages secondaires Étudiant
        '/student/pdf_view': (context) => StudentPdfViewPage(),
        '/student/upload': (context) => StudentUploadPage(),
        '/student/search': (context) => const StudentSearchPage(),
        '/student/profile_edit': (context) => StudentProfileEditPage(),
        '/student/notifications': (context) => const StudentNotificationsPage(),
        '/student/documents_page': (context) => StudentDocumentsPage(),
        '/student/convention_form': (context) => ConventionFormPage(),
        '/student/attestation_form': (context) => AttestationForm(),

        // Partie Parent
        '/parent/home': (context) => HomePage(),
        '/parent/documents': (context) => ParentDocumentsPage(), // <-- mis à jour
        '/parent/profile': (context) => ParentProfilePage(),
        '/parent/notifications': (context) => ParentNotificationsPage(),
        '/parent/document_request': (context) => ParentDocumentRequestPage(),
        '/parent/document_view': (context) => ParentDocumentViewPage(),
        '/parent/profile_edit': (context) => ParentProfileEditPage(),
        '/parent/profile_edit_success': (context) => ParentProfileEditSuccessPage(),
      },
    );
  }
}

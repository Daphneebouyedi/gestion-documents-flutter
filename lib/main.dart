import 'package:flutter/material.dart';

// Pages Étudiant
import 'screens/student/student_login_page.dart';
import 'screens/student/student_main_screen.dart';
import 'screens/student/student_pd_view.dart';
import 'screens/student/student_upload_age.dart';
import 'screens/student/student_search_page.dart';
import 'screens/student/student_profile_edit_page.dart';
// ...existing code...
import 'screens/student/student_notifications_page.dart';
// ...existing code...

// Pages Parent
import 'screens/parent/parent_login_page.dart';
import 'screens/parent/parent_profile_page.dart';
import 'screens/parent/parent_notifications_page.dart';
import 'screens/parent/parent_document_request_page.dart';
import 'screens/parent/parent_document_view_page.dart';
// ...existing code...
import 'screens/parent/parent_profile_edit_page.dart';
import 'screens/parent/parent_profile_edit_success_page.dart';
import 'screens/parent/home_page.dart';
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
        // Page de connexion unique
        '/login': (context) =>  StudentLoginPage(),

        // Partie Étudiant
        '/student/home': (context) =>  StudentMainScreen(initialIndex: 0),
        '/student/documents': (context) => StudentMainScreen(initialIndex: 1),
        '/student/profile': (context) => StudentMainScreen(initialIndex: 2),
        '/student/request': (context) => StudentMainScreen(initialIndex: 3),

        // Pages secondaires Étudiant
        '/student/pdf_view': (context) => StudentPdfViewPage(),
        '/student/upload': (context) => StudentUploadPage(),
        '/student/search': (context) => StudentSearchPage(),
        '/student/profile_edit': (context) => StudentProfileEditPage(),
  // '/student/payments': (context) => StudentPaymentsPage(),
        '/student/notifications': (context) => StudentNotificationsPage(),

        // Partie Parent
        '/parent/login': (context) => ParentLoginPage(),
        '/parent/home': (context) => HomePage(),
        '/parent/documents': (context) =>  ParentDocumentViewPage(),
        '/parent/profile': (context) => ParentProfilePage(),
        '/parent/notifications': (context) => ParentNotificationsPage(),
        '/parent/document_request': (context) => ParentDocumentRequestPage(),
        '/parent/document_view': (context) =>  ParentDocumentViewPage(),
  // '/parent/payments': (context) =>  ParentPaymentPage(),
        '/parent/profile_edit': (context) =>  ParentProfileEditPage(),
        '/parent/profile_edit_success': (context) =>  ParentProfileEditSuccessPage(),
      },
    );
  }
}

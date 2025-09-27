import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/test_users.dart'; // Importer les utilisateurs
// ⚡ La simulation des utilisateurs est maintenant dans /lib/data/test_users.dart

class StudentLoginPage extends StatefulWidget {
  const StudentLoginPage({super.key});

  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage;

  void _login() {
    if (_formKey.currentState!.validate()) {
      final enteredUsername = _usernameController.text.trim();
      final enteredPassword = _passwordController.text;

      final user = testUsers.firstWhere(
        (u) =>
            u['username'] == enteredUsername &&
            u['password'] == enteredPassword,
        orElse: () => {},
      );

      if (user.isEmpty) {
        setState(() {
          errorMessage = "Username ou mot de passe incorrect";
        });
        return;
      }

      final role = user['role'];
      if (role == 'student') {
        Navigator.pushReplacementNamed(
          context,
          '/student/home',
          arguments: user,
        );
      } else if (role == 'parent') {
        Navigator.pushReplacementNamed(
          context,
          '/parent/home',
          arguments: user,
        );
      } else {
        setState(() {
          errorMessage = "Rôle inconnu";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBar(
          backgroundColor: turquoise,
          elevation: 0,
          title: const Text(
            "Connexion",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
              letterSpacing: 1,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Votre username",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Veuillez entrer votre username"
                        : null,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Mot de passe",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Mot de Passe",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    ),
                    validator: (value) => (value == null || value.isEmpty)
                        ? "Veuillez entrer votre mot de passe"
                        : null,
                  ),
                  const SizedBox(height: 8),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: turquoise,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _login,
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

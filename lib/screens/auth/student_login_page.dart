import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/test_users.dart';
import 'package:flutter_application_1/theme.dart';

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

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/Etudiants.png', // Your background image
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent, // Make Scaffold background transparent
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24), // Moved padding here
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100), // Added to push content down
                    Center(
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32, // Increased font size for prominence
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40), // Spacing after title
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: whiteColor), // Changed text color
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _usernameController,
                      style: TextStyle(color: whiteColor), // Text color white
                      decoration: InputDecoration(
                        hintText: "Votre username",
                        filled: true,
                        fillColor: blackColor.withOpacity(0.4), // Darkened transparent black
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
                    Text(
                      "Mot de passe",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: whiteColor), // Changed text color
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: whiteColor), // Text color white
                      decoration: InputDecoration(
                        hintText: "Mot de Passe",
                        filled: true,
                        fillColor: blackColor.withOpacity(0.4), // Darkened transparent black
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(fontSize: 13, color: whiteColor), // Changed text color
                      ),
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(color: errorColor),
                        ),
                      ),
                    const SizedBox(height: 22),
                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor, // Changed to whiteColor
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: _login,
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(fontSize: 18, color: blackColor), // Changed to blackColor
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

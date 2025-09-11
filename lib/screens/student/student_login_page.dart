import 'package:flutter/material.dart';

class StudentLoginPage extends StatefulWidget {
  const StudentLoginPage({super.key});
  @override
  State<StudentLoginPage> createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  int _selectedRole = 1; // 0=Parent, 1=Etudiant

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/student/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    const turquoise = Color(0xFF24B6AA);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(58),
        child: AppBar(
          backgroundColor: turquoise,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
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
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Role", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  Row(
                    children: [
                      Radio<int>(
                        value: 0,
                        groupValue: _selectedRole,
                        activeColor: turquoise,
                        onChanged: (v) => setState(() => _selectedRole = v!),
                      ),
                      Text("Parent", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 16),
                      Radio<int>(
                        value: 1,
                        groupValue: _selectedRole,
                        activeColor: turquoise,
                        onChanged: (v) => setState(() => _selectedRole = v!),
                      ),
                      Text("Etudiant", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text("Email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 6),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Adresse-mail",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? "Veuillez entrer votre email" : null,
                  ),
                  SizedBox(height: 16),
                  Text("Mot de passe", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 6),
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
                      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                    ),
                    validator: (value) =>
                        (value == null || value.isEmpty) ? "Veuillez entrer votre mot de passe" : null,
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 22),
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
                      child: Text(
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
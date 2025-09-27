class User {
  final String username;
  final String password;
  final String role;
  final String fullname;
  final String email;

  User({
    required this.username,
    required this.password,
    required this.role,
    required this.fullname,
    required this.email,
  });

  factory User.fromMap(Map<String, String> map) {
    return User(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? '',
      fullname: map['fullname'] ?? '',
      email: map['email'] ?? '',
    );
  }
}

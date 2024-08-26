import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrapture/models/auth.dart';
import 'package:vrapture/models/firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;

  void _register() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isNotEmpty &&
        age.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      try {
        await Auth().createUserWithEmailandPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Registration Successful!',
            ),
            backgroundColor: Colors.deepPurple[900],
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  Widget _inputField(
      String title, TextEditingController controller, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          hintText:
              title == 'Password' ? 'Enter your Password' : 'Enter your $title',
          filled: true,
          fillColor: const Color.fromARGB(193, 255, 255, 255).withOpacity(0.1),
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Color.fromARGB(174, 255, 255, 255)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        style: const TextStyle(color: Colors.white),
        obscureText: obscureText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 25, 3, 56),
        title: Image.asset('images/logo.png', scale: 4.2),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3F0E40), Color(0xFF1C052A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "REGISTER",
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _inputField('Name', _nameController, false),
            _inputField('Age', _ageController, false),
            _inputField('Email', _emailController, false),
            _inputField('Password', _passwordController, isObscure),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Firestore.uploadData(
                      name: _nameController.text,
                      age: _ageController.text,
                      email: _emailController.text,
                    );
                    _register();
                  },
                  icon: const Icon(Icons.send),
                  label: Text(
                    'Register',
                    style: GoogleFonts.orbitron(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 0, 120),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vrapture/helpers/pass_reset.dart';
import 'package:vrapture/helpers/register.dart';
import 'package:vrapture/models/auth.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({super.key});

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {
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

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 60, 0, 120),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Text(
              "Delve Into The Exciting World of Virtual Reality! Get Started",
              style: GoogleFonts.oxanium(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 38,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          Flexible(
            child: Column(
              children: [
                _inputField("Email ID", _controllerEmail, false),
                _inputField("Password", _controllerPassword, isObscure),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: IconButton(
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
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[900],
                        ),
                        onPressed: () => {
                          Auth().signinWithEmailandPassWord(
                              email: _controllerEmail.text,
                              password: _controllerPassword.text)
                        },
                        child: Text(
                          "LOGIN",
                          style: GoogleFonts.oxanium(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[900],
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          ),
                        },
                        child: Text(
                          "REGISTER",
                          style: GoogleFonts.oxanium(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[900],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordResetPage(),
                      ),
                    );
                  },
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: GoogleFonts.oxanium(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
